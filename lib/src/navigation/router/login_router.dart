
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tele_flicks/src/features/login/screens/login_screen.dart';

class LoginRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static List<String> routeStack = [];

  GoRouter get router => _router;

  static const rout = '/';

  static const login = 'login';

  static const contact = 'contact';

  final GoRouter _router = GoRouter(
    initialLocation: '$rout$login',
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: rout,
        path: rout,
        redirect: (context, state) => null,
        routes: [
          GoRoute(
              name: login,
              path: login,
              builder: (context, state) {
                return const LoginScreen();
              })
        ],
      ),
    ],
    // errorPageBuilder: (context, state) => buildPageForPlatform(
    //     context, state, kIsWeb ? const Error404Screen() : const ErrorScreen()),
  );
}
