import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_for_israel/base/SharedPrefModule.dart';
import 'package:go_for_israel/event/RegistrationEvent.dart';
import 'package:go_for_israel/model/UserModel.dart';
import 'package:go_for_israel/page/NavigatorPage.dart';
import 'package:go_for_israel/repository/RegistrationRepository.dart';
import 'package:go_for_israel/state/RegistrationState.dart';
import 'package:go_for_israel/utils/Router.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  @override
  RegistrationState get initialState => RegistrationInitState();
  RegistrationRepository repository = RegistrationRepository();
  String email;

  @override
  Stream<RegistrationState> mapEventToState(RegistrationState currentState, RegistrationEvent event) async* {
    if(event is RegistrationSaveUserFirstStepEvent) {
      UserModel newUser = UserModel.empty();

      newUser.company_name = event.companyName;
      newUser.country = getCountry(event.country);
      newUser.category = getCategory(event.field);
      newUser.isInvestor = event.investor;
      newUser.avatar_path = event.avatar;
      await SharedPrefModule.saveUser(newUser);
    }
    if(event is RegistrationSaveUserTwoStepEvent) {
      UserModel user = await SharedPrefModule.getUserModel();
      user.website = event.website;
      user.title = event.title;
      user.company_description = event.companyDescription;
      user.company_representative = event.companyRepresentative;
      user.phone = event.mobile;
      user.employees = getEmployees(event.numberOfEmployers.toString());
      user.path_photo = event.path_photo;
      user.path_logo = event.path_logo;
      user.path_pager = event.path_pager;
      await SharedPrefModule.saveUser(user);
    }
    if(event is RegistrationSaveUserThreeStepEvent) {
      yield RegistrationLoadingState();
      UserModel user = await SharedPrefModule.getUserModel();
      user.stage = event.stage;
      user.past_investments = event.pastInvestments;
      user.raising = event.raising;
      user.invest_in_usd = event.investInUSD;
      user.email = event.email;
      await SharedPrefModule.saveUser(user);
      await repository.registration(user);
      Navigator.pushReplacement(event.context, Router(builder: (context) => NavigatorPage()));
      //yield RegistrationHideState();
    }
  }

  String getCategory(String category) {
    if(category == "0") return "Category0";
    if(category == "1") return "Category1";
    if(category == "2") return "Category2";
    if(category == "3") return "Category3";
  }
  String getCountry(String country) {
    if(country == "0") return "Country0";
    if(country == "1") return "Country1";
    if(country == "2") return "Country2";
    if(country == "3") return "Country3";
  }
  String getEmployees(String employees) {
    if(employees == "0") return "Empl0";
    if(employees == "1") return "Empl1";
    if(employees == "2") return "Empl2";
    if(employees == "3") return "Empl3";
  }
}