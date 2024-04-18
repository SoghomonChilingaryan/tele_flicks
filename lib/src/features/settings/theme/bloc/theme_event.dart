// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangeThemeEvent extends ThemeEvent {
  final Brightness theme;
  const ThemeChangeThemeEvent({
    required this.theme,
  });
}

class ThemeSwitchPrimaryColorEvent extends ThemeEvent {
  final Color color;
  const ThemeSwitchPrimaryColorEvent({
    required this.color,
  });
}
