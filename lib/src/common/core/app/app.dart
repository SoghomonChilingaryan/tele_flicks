import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/core/di/di_setup.dart';
import 'package:tele_flicks/src/common/core/interceptors/auth_interceptor.dart';
import 'package:tele_flicks/src/common/data/repositories/secure_storage_repository.dart';
import 'package:tele_flicks/src/common/local/generated/l10n.dart';
import 'package:tele_flicks/src/features/settings/theme/bloc/theme_bloc.dart';
import 'package:tele_flicks/src/features/settings/theme/data/theme_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tele_flicks/src/features/user_state/bloc/user_state_bloc.dart';
import 'package:tele_flicks/src/features/user_state/screens/user_state_listener.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(
            repository: getIt<ThemeRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) => UserStateBloc(
            authInterceptor: getIt<AuthInterceptor>(),
            secureStorage: getIt<SecureStorageRepository>(),
          ),
        ),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'TeleFlicks',
          theme: state,
          home: UserStateListener(),
        );
      },
    );
  }
}
