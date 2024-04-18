import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/core/di/di_service.dart';
import 'package:tele_flicks/src/features/settings/theme/bloc/theme_bloc.dart';
import 'package:tele_flicks/src/features/settings/theme/data/theme_repository.dart';
import 'package:tele_flicks/src/features/splash/screens/splash_screen.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ThemeBloc(repository: getIt<ThemeRepository>())),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          theme: state,
          builder: (context, child) => const SplashScreen(
            child: Placeholder(),
          ),
        );
      },
    );
  }
}
