part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginCheckLocalDataEvent extends LoginEvent {
  LoginCheckLocalDataEvent();
}

class LoginUserNameFiledChanged extends LoginEvent {
  final String userName;

  LoginUserNameFiledChanged(this.userName);
}
class LoginPasswordFiledChanged extends LoginEvent {
  final String password;

  LoginPasswordFiledChanged(this.password);
}

final class LoginAuthenticationEvent extends LoginEvent {
  final String userName;
  final String password;

  LoginAuthenticationEvent({
    required this.userName,
    required this.password,
  });
}

final class LoginChangePasswordObscureTextEvent extends LoginEvent {
  LoginChangePasswordObscureTextEvent();
}
