import 'package:meta/meta.dart';

abstract class LoginEvent{}

class LoginUserEvent extends LoginEvent{
  final dynamic;
  LoginUserEvent({@required  this.dynamic});
}