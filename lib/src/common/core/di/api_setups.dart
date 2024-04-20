import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tele_flicks/src/common/core/config/app_config.dart';
import 'package:tele_flicks/src/common/core/di/di_setup.dart';
import 'package:tele_flicks/src/common/core/interceptors/auth_interceptor.dart';
import 'package:tele_flicks/src/common/core/interceptors/response_interceptor.dart';
import 'package:player_api/player_api.dart';

Future<void> apiSetups() async {
  getIt.registerSingleton<AuthInterceptor>(AuthInterceptor());

  getIt.registerLazySingleton(() => PlayerApi(_playerApiBaseOptions(
        AppConfig.backendUrl.playerApi,
        getIt<AuthInterceptor>(),
      )));
}

Dio _playerApiBaseOptions(
  String playerApiUrl,
  AuthInterceptor authInterceptor,
) {
  final BaseOptions options = BaseOptions(
    baseUrl: playerApiUrl,
    responseType: ResponseType.json,
  );
  final dio = Dio(options);
  dio.interceptors.addAll([
    ..._buildBaseInterceptors(),
    authInterceptor,
  ]);
  return dio;
}


List<Interceptor> _buildBaseInterceptors() {
  return [
    if (kDebugMode)
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: kDebugMode ? (m) => log(m.toString()) : print,
      ),
    ResponseConverter(),
  ];
}
