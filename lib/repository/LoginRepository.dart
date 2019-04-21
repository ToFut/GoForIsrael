import 'package:flutter/material.dart';
import 'package:go_for_israel/base/Api.dart';
import 'package:go_for_israel/base/BaseApi.dart';
import 'package:go_for_israel/base/MethodType.dart';
import 'package:go_for_israel/base/SharedPrefModule.dart';
import 'package:go_for_israel/model/ErrorModel.dart';
import 'package:go_for_israel/model/TokenModel.dart';

class LoginRepository {
  final BaseApi _api = BaseApi();

  Future<dynamic> login({@required String email, @required String password}) async {
    TokenModel token;
      Map<String, dynamic> map = await _api.sendBase({"email" : email, "password": password}, Api.LOGIN, MethodType.POST, false);
      if(map.containsKey("user") && map["user"] != null){
        token = TokenModel.fromJson(map["user"]);
        if(token != null) {
          await SharedPrefModule.saveToken(token);
        }
        return token;
      } else {
        if(map.containsKey("error")) {
          ErrorModel model = ErrorModel.fromJson(map);
          return model;
        }
      }
  }
}