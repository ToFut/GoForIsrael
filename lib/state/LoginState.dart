import 'package:meta/meta.dart';

abstract class LoginState{}

class LoginEmptyState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginHideState extends LoginState{}

class LoginLoadedState extends LoginState{
  final dynamic data;
  LoginLoadedState({@required this.data});
}

class LoginErrorState extends LoginState{}