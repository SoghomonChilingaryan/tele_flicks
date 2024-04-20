import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:player_api/player_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tele_flicks/src/common/core/di/api_setups.dart';
import 'package:tele_flicks/src/common/core/interceptors/auth_interceptor.dart';
import 'package:tele_flicks/src/common/data/repositories/secure_storage_repository.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/data/live_tv_menu_repository.dart';
import 'package:tele_flicks/src/features/settings/theme/data/theme_repository.dart';

import '../../../features/login/data/login_repository.dart';

GetIt getIt = GetIt.instance;

// extension GetItX on GetIt {
//   T read<T>() {
//     return getIt<T>();
//   }
// }

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await Future.delayed(Duration(seconds: 1));

  await apiSetups();

  final pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => SecureStorageRepository());

  getIt.registerLazySingleton<ThemeRepository>(
      () => ThemeRepository(pref: pref));

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(
        playerApi: getIt<PlayerApi>(),
        authInterceptor: getIt<AuthInterceptor>(),
        secureStorage: getIt<SecureStorageRepository>(),
      ));

  getIt.registerLazySingleton<LiveTvMenuRepository>(() => LiveTvMenuRepository(
        playerApi: getIt<PlayerApi>(),
      ));
}
