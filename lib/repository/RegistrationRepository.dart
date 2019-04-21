import 'dart:io';

import 'package:dio/dio.dart';
import 'package:go_for_israel/base/Api.dart';
import 'package:go_for_israel/base/BaseApi.dart';
import 'package:go_for_israel/base/MethodType.dart';
import 'package:go_for_israel/model/UserModel.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';

class RegistrationRepository{
  final BaseApi _api = BaseApi();
  Future<dynamic> registration(UserModel user) {
    Map<String, dynamic> userMap;
    if(RegistrationPage.isInvestor) {
      userMap = {
        "user_type": 2,
        "company_name" : user.company_name,
        "category" : user.category,
        "country" : user.country,
        "company_representative" : user.company_representative,
        "title" : user.title,
        "company_description" : user.company_description,
        "website" : user.website,
        "employees" : user.employees,
        "phone" : user.phone,
        "past_investments" : user.past_investments,
        "ticket_size" : user.ticket_size,
        "invest_in_usd " : user.invest_in_usd,
        "email" : user.email,
        "password" : user.password
      };
    }

    if(!RegistrationPage.isInvestor) {
      userMap = {
        "user_type" : 3,
        "company_name" : user.company_name,
        "category" : user.category,
        "country" : user.country,
        "company_representative" : user.company_representative,
        "title" : user.title,
        "company_description" : user.company_description,
        "website" : user.website,
        "employees" : user.employees,
        "phone" : user.phone,
        "raising" : user.raising,
        "email" : user.email,
        "stage" : user.stage,
        "password" : user.password
      };
    }
    if(user.avatar_path != null) {
      userMap.addAll({
        "photo":UploadFileInfo(File(user?.avatar_path != null ? user.avatar_path : ""), "avatar.png")
      });
    }

    if(user.path_logo != null) {
      userMap.addAll({
        "company_logo ": UploadFileInfo(
            File(user?.path_logo != null ? user.path_logo : ""), "logo.png")
      });
    }
    if(user.path_pager != null) {
      userMap.addAll({
        "one_pager":UploadFileInfo(File(user?.path_logo != null ? user.path_logo : ""), "pager.png")
      });
    }
    _api.sendFileAndFields(userMap, Api.REGISTER, MethodType.POST);
  }
}