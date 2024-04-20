// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/screen/live_tv_screen.dart';
import 'package:tele_flicks/src/features/menu/screens/menu_screens.dart';
import 'package:tele_flicks/src/features/movies/screens/movies_screen.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static List<String> routeStack = [];

  GoRouter get router => _router;

  static const appRout = '/';

  static const menu = 'menu';

  static const liveTv = 'live_tv';

  static const movies = 'movies';

  final GoRouter _router = GoRouter(
    initialLocation: '$appRout$liveTv',
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    // redirect: (context, state) {
    //   final currentRoute = state.uri.toString();
    //   return currentRoute;
    // },
    routes: <RouteBase>[
      GoRoute(
        name: appRout,
        path: appRout,
        redirect: (context, state) => null,
        routes: [
          GoRoute(
              name: menu,
              path: menu,
              builder: (context, state) {
                return const MenuScreen();
              }),
          GoRoute(
              name: liveTv,
              path: liveTv,
              builder: (context, state) {
                return const LiveTvMenuScreen();
              }),
          GoRoute(
              name: movies,
              path: movies,
              builder: (context, state) {
                return const MoviesScreen();
              })
        ],
      ),
    ],
    // errorPageBuilder: (context, stfaqate) => buildPageForPlatform(
    //     context, state, kIsWeb ? const Error404Screen() : const ErrorScreen()),
  );
}
