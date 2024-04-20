import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  Color get primaryColor =>Theme.of(this).colorScheme.primary;

  void hideKeyboard() {
    final focusNode = FocusScope.of(this);
    if (!focusNode.hasPrimaryFocus) {
      focusNode.unfocus();
    }
  }

}
