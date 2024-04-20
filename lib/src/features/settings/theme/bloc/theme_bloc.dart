import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:tele_flicks/src/common/res/app_theme.dart';
import 'package:tele_flicks/src/features/settings/theme/data/theme_repository.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final ThemeRepository _repository;

  ThemeBloc({
    required ThemeRepository repository,
  })  : _repository = repository,
        super(_initialTheme(repository)) {
    on<ThemeEvent>(
      (event, emit) {
        switch (event) {
          case ThemeChangeThemeEvent():
            return _changeTheme(event, emit);
          case ThemeSwitchPrimaryColorEvent():
            return _switchPrimaryColor(event, emit);
        }
      },
      transformer: droppable(),
    );
  }

  Future<void> _changeTheme(
      ThemeChangeThemeEvent event, Emitter<ThemeData> emit) async {
    final repoColor = _repository.getPrimaryColor();
    final primaryColor = repoColor != null ? Color(repoColor) : null;
    if (event.theme == Brightness.dark) {
      final newLightTheme = AppTheme.lightTheme.copyWith(
        colorScheme:
            AppTheme.lightTheme.colorScheme.copyWith(primary: primaryColor),
      );
      emit(newLightTheme);
      await _repository.saveTheme(false);
    } else {
      final newDarkTheme = AppTheme.darkTheme.copyWith(
          colorScheme:
              AppTheme.darkTheme.colorScheme.copyWith(primary: primaryColor));
      await _repository.saveTheme(true);
      emit(newDarkTheme);
    }
  }

  Future<void> _switchPrimaryColor(
      ThemeSwitchPrimaryColorEvent event, Emitter<ThemeData> emit) async {
    final color = event.color;
    _repository.savePrimaryColor(color.value);
    final updatedTheme = state.copyWith(
      colorScheme: state.colorScheme.copyWith(primary: color),
    );
    emit(updatedTheme);
  }

  static ThemeData _initialTheme(ThemeRepository repository) {
    // final isDarkTheme = repository.isDarkTheme();
    final repoColor = repository.getPrimaryColor();
    final color = repoColor != null ? Color(repoColor) : null;
    return AppTheme.darkTheme.copyWith(
        colorScheme: AppTheme.darkTheme.colorScheme.copyWith(primary: color));
    // return isDarkTheme
    //     ? AppTheme.darkTheme.copyWith(
    //         colorScheme:
    //             AppTheme.darkTheme.colorScheme.copyWith(primary: color))
    //     : AppTheme.lightTheme.copyWith(
    //         colorScheme:
    //             AppTheme.lightTheme.colorScheme.copyWith(primary: color));
  }
}
