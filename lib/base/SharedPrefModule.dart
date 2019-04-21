import 'dart:convert';
import 'package:go_for_israel/model/TokenModel.dart';
import 'package:go_for_israel/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefModule {
  static final String TOKEN_KEY = "token key";
  static final String _USER_KEY = "user key";

  static Future saveToken(TokenModel tokenModel) async{
    await SharedPreferences.getInstance().then((data){
          data.setString(TOKEN_KEY, jsonEncode(tokenModel.toJson()));
        });
  }

  static Future<TokenModel> getTokenModel() async{
    var token =  await SharedPreferences.getInstance().then((data) {
      return TokenModel.fromJson(jsonDecode(data.getString(TOKEN_KEY)));
    });
    return token;
  }

  static Future removeUser() async{
    await SharedPreferences.getInstance().then(
            (data){
          data.remove(_USER_KEY);
          data.remove(TOKEN_KEY);
        });
  }

  static Future saveUser(UserModel userModel) async{
    await SharedPreferences.getInstance().then(
            (data){
              Map toJs = userModel.toJson();
          data.setString(_USER_KEY, jsonEncode(toJs));
        });
  }

  static Future<UserModel> getUserModel() async{
    var user =  await SharedPreferences.getInstance().then((data) {
      return UserModel.fromJson(jsonDecode(data.getString(_USER_KEY)));
    });
    return user;
  }
}