import 'package:bloc/bloc.dart';
import 'package:go_for_israel/event/LoginEvent.dart';
import 'package:go_for_israel/state/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  get initialState => LoginEmptyState();

  @override
  Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async*{
  }
}