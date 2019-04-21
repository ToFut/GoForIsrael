import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_for_israel/event/LoginEvent.dart';
import 'package:go_for_israel/model/ErrorModel.dart';
import 'package:go_for_israel/model/TokenModel.dart';
import 'package:go_for_israel/page/NavigatorPage.dart';
import 'package:go_for_israel/page/registration_page/RegistrationPage.dart';
import 'package:go_for_israel/repository/LoginRepository.dart';
import 'package:go_for_israel/state/LoginState.dart';
import 'package:go_for_israel/utils/Constants.dart';
import 'package:go_for_israel/utils/Router.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginRepository repository;

  LoginBloc({@required this.repository})
      : assert(repository != null);

  @override
  get initialState => LoginEmptyState();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async*{
    if(event is LoginUserEvent) {
      yield LoginLoadingState();
      dynamic response = await repository.login(email: event.email, password: event.password);

      if(response is TokenModel) {
        if(response != null) {
        yield LoginHideState();
          if(response.userType == Constants.GUEST_USER_TYPE) {
            Navigator.push(event.context, Router(builder: (context) => RegistrationPage(event.email, event.password)));
            return;
          }
          Navigator.push(event.context, Router(builder: (context) => NavigatorPage()));
          return;
        }
      }

      if(response is ErrorModel) {
        Scaffold.of(event.context).showSnackBar(SnackBar(content: Text("User is not found")));
        yield LoginHideState();
      }
    }
  }
}