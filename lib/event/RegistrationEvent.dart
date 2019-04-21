import 'dart:io';

import 'package:flutter/material.dart';

abstract class RegistrationEvent {
}

class RegistrationSaveUserFirstStepEvent extends RegistrationEvent {
  String companyName;
  String avatar;
  bool investor;
  String field;
  String country;
  RegistrationSaveUserFirstStepEvent(this.companyName, this.investor, this.field, this.country, this.avatar);
}
class RegistrationSaveUserTwoStepEvent extends RegistrationEvent {
  String companyRepresentative;
  String title;
  String companyDescription;
  String website;
  String addingPhoto;
  String companyLogo;
  int numberOfEmployers;
  String mobile;
  String path_photo;
  String path_logo;
  String path_pager;

  RegistrationSaveUserTwoStepEvent(this.companyRepresentative, this.title, this.companyDescription,
      this.website, this.numberOfEmployers, this.mobile, this.path_photo, this.path_logo, this.path_pager);
}
class RegistrationSaveUserThreeStepEvent extends RegistrationEvent {
  String stage;
  String pastInvestments;
  String raising;
  String ticketSize;
  String email;
  String password;
  BuildContext context;
  int investInUSD;
  RegistrationSaveUserThreeStepEvent(this.stage, this.pastInvestments, this.raising,this.ticketSize, this.investInUSD, this.email, this.password, this.context);

}