// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static List<String> routeStack = [];

  GoRouter get router => _router;

  static const appRout = '/';

  static const faq = 'faq';

  static const contact = 'contact';

  final GoRouter _router = GoRouter(
    initialLocation: appRout,
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
        // builder: (context, state) {
        //   return const HomeScreen();
        // },
        redirect: (context, state) => null,
        routes: [
          // GoRoute(
          //     name: faq,
          //     path: faq,
          //     pageBuilder: (context, state) {
          //       return buildPageForPlatform(context, state, const FaqScreen());
          //     })
        ],
      ),
    ],
    // errorPageBuilder: (context, stfaqate) => buildPageForPlatform(
    //     context, state, kIsWeb ? const Error404Screen() : const ErrorScreen()),
  );
}
