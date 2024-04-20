import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String _username = '';
  String _password = '';


  void updateCredentials(String username, String password) {
    _username = username;
    _password = password;
  }
  
  void deleteCredentials() {
    _username = '';
    _password = '';
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_username.isEmpty && _password.isNotEmpty) {
      options.queryParameters.addAll({
        'username': _username,
        'password': _password,
      });
    }
    handler.next(options);
  }
}
