// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> _navigatorKey;
  AppNavigator(this._navigatorKey);

  void go(String route, {Object? extra}) {
    _navigatorKey.currentContext!.go(route, extra: extra);
  }

  void goNamed(String routeName, {Object? args}) {
    _navigatorKey.currentContext!.goNamed(routeName, extra: args);
  }

  void pushNamed(String routeName,
      {Object? args, Map<String, dynamic> queryParameters = const {}}) {
    _navigatorKey.currentContext!.pushNamed(routeName, extra: args);
  }

  void replaceNamed(String route, {Object? extra}) {
    _navigatorKey.currentContext!.replaceNamed(route, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    // AppRouter.routeStack.removeLast();
    _navigatorKey.currentContext!.pop<T>(result);
  }
}
