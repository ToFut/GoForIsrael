import 'dart:async';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:go_for_israel/base/MethodType.dart';
import 'package:go_for_israel/base/SharedPrefModule.dart';

class BaseApi {
  static Dio dio = Dio();
  static const String BASE_URL = "https://gfi.cyberarchers.com";
  final Map<String, String> authHeaders = {"Accept": "application/json"};

  BaseApi() {
    dio.options.baseUrl = BASE_URL;
    dio.interceptors.add(LogInterceptor(requestBody: true));
  }

  Future<Map<String, dynamic>> sendBase(
      Map<dynamic, dynamic> data, String api, MethodType type,[bool isNeedToken]) async {
    dio.options.headers = authHeaders;
    if(isNeedToken) {
      Map<String, dynamic> headers = await _getBaseHeaders();
      dio.options.headers = headers;
    }
    switch (type) {
      case MethodType.GET:
        return _dataHandler(dio.get(BASE_URL + api));
      case MethodType.POST:
        return _dataHandler(dio.post(BASE_URL + api, data: data));
      case MethodType.DELETE:
      case MethodType.PUT:
    }
    return null;
  }

  Future<Map<String, dynamic>> _dataHandler(Future<Response> response) async {
    try{
      Response responseData = await response;
      if (responseData.statusCode != 200)
        throw DioError(response: responseData, error: responseData.statusCode);
      return responseData.data;
    } on DioError catch(e) {
      return e.response.data;
    }
  }

  Future<Map<String, String>> _getBaseHeaders() async {
    Map<String, String> headers = {"Accept": "application/json"};
    await SharedPrefModule.getTokenModel().then((tokenModel) {
      headers.putIfAbsent(
          "Authorization", () => "Token " + tokenModel.token);
    });

    return headers;
  }

  Future<Map<String, dynamic>> sendFileAndFields(Map<String, dynamic> data,
      String api, MethodType type) async {
    Map<String, dynamic> headers = await _getBaseHeaders();
    dio.options.headers = headers;
    FormData formData = FormData.from(data);
    Map callback = await loadIsolate(api, headers, formData);
    return callback;
  }

  Future<Map> loadIsolate(String api, headers, files) async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(isolateEntry, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;
    return await sendReceive(sendPort, api, headers, files);
  }

  static isolateEntry(SendPort sendPort) async {
    ReceivePort port = ReceivePort();
    sendPort.send(port.sendPort);
    await for (var msg in port) {
      String url = msg[0];
      Map headers = msg[1];
      SendPort replyPort = msg[2];
      FormData formData = msg[3];
      dio.options.baseUrl = BASE_URL;
      dio.options.headers = headers;
      try {
        Response response = await dio.post(url, data: formData);
        print(response.data);
        replyPort.send(response.data);
      } catch (ex) {
        print(ex.toString());
      }
    }
  }

  Future sendReceive(SendPort send, api, headers, files) {
    ReceivePort responsePort = ReceivePort();

    send.send([api, headers, responsePort.sendPort, files]);
    return responsePort.first;
  }
}