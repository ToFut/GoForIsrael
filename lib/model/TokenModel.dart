class TokenModel{
  String token;
  int userType;

  TokenModel.fromJson(Map<String, dynamic> json) :
        token = json['token'],
        userType = json['type'];

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'type' : userType
    };
  }
}