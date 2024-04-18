import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:web/web.dart' as web;

class AppNavigator {
  final GlobalKey<NavigatorState> _navigatorKey;
  AppNavigator(this._navigatorKey);

  void go(String route, {Object? extra}) {
    _navigatorKey.currentContext!.go(route, extra: extra);
  }

  void pushNamed(String routeName, {Object? args}) {
    _navigatorKey.currentContext!.goNamed(routeName, extra: args);
  }

  void goNamed(String routeName, {Object? args}) {
    _navigatorKey.currentContext!.goNamed(routeName, extra: args);
  }

  void replaceNamed(String route, {Object? extra}) {
    _navigatorKey.currentContext!.replaceNamed(route, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    web.window.history.back();
  }
}
