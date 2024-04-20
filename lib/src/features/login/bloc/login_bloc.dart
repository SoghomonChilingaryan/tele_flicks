import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tele_flicks/src/features/app_progress/app_progress_bloc.dart';
import 'package:tele_flicks/src/features/login/data/login_repository.dart';
import 'package:tele_flicks/src/features/user_state/bloc/user_state_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserStateBloc _userStateBloc;
  final LoginRepository _repository;
  final AppProgressBloc _progressBloc;
  LoginBloc({
    required UserStateBloc userStateBloc,
    required LoginRepository repository,
    required AppProgressBloc progressBloc,
  })  : _repository = repository,
        _userStateBloc = userStateBloc,
        _progressBloc = progressBloc,
        super(LoginState()) {
    on<LoginEvent>((event, emit) {
      switch (event) {
        case LoginCheckLocalDataEvent():
          return _checkLocalData(event, emit);
        case LoginAuthenticationEvent():
          return _authentication(event, emit);
        case LoginChangePasswordObscureTextEvent():
          emit(state.copyWith(passwordObscureText: !state.passwordObscureText));
        case LoginUserNameFiledChanged():
          emit(state.copyWith(error: false));
        case LoginPasswordFiledChanged():
          emit(state.copyWith(error: false));
      }
    });
  }

  Future<void> _authentication(
      LoginAuthenticationEvent event, Emitter<LoginState> emit) async {
    if (event.userName.isEmpty || event.password.isEmpty) return;
    _progressBloc.add(AppProgressChangeProgressEvent(true));
    try {
      final isAuthenticated = await _repository.authentication(
        userName: event.userName,
        password: event.password,
      );
      if (isAuthenticated) {
        _repository.changeLocalUserData(
            userName: event.userName, password: event.password);
        _userStateBloc.add(UserStateLoginEvent());
      } else {
        emit(state.copyWith(error: true));
      }
    } catch (e) {
      emit(state.copyWith(error: true));
    }
    _progressBloc.add(AppProgressChangeProgressEvent(false));
  }

  Future<void> _checkLocalData(
      LoginCheckLocalDataEvent event, Emitter<LoginState> emit) async {
    try {
      final userData = await _repository.getUserLocalData();
      if (userData != null) {
        emit(state.copyWith(userName: userData.$1, password: userData.$2));
      }
    } catch (e) {}
  }
}
