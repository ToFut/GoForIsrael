import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent{}

class LoginLoaderHide extends LoginEvent {}
class LoginUserEvent extends LoginEvent{
  final String email;
  final String password;
  final BuildContext context;
  LoginUserEvent({@required  this.email, @required this.password, @required this.context});
}