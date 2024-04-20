// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String userName;
  final String password;
  final bool passwordObscureText;
  final bool error;
  const LoginState({
    this.userName = '',
    this.password = '',
    this.passwordObscureText = true,
    this.error = false,
  });

  @override
  List<Object> get props => [
        userName,
        password,
        passwordObscureText,
        error,
      ];

  LoginState copyWith({
    String? userName,
    String? password,
    bool? passwordObscureText,
    bool? error,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      passwordObscureText: passwordObscureText ?? this.passwordObscureText,
      error: error ?? this.error,
    );
  }
}
