class ErrorModel {
  int _statusCode;
  int _code;
  String _message;

  ErrorModel.fromJson(Map<String, dynamic> json) :
        _statusCode = json['statusCode'],
        _code = json['error']['code'],
        _message = json['error']['message'];
}