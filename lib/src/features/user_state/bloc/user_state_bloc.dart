import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tele_flicks/src/common/core/interceptors/auth_interceptor.dart';
import 'package:tele_flicks/src/common/data/repositories/secure_storage_repository.dart';

part 'user_state_event.dart';
part 'user_state_state.dart';

class UserStateBloc extends Bloc<UserStateEvent, UserStateState> {
  final SecureStorageRepository _secureStorage;
  final AuthInterceptor _authInterceptor;

  UserStateBloc({
    required AuthInterceptor authInterceptor,
    required SecureStorageRepository secureStorage,
  })  : _authInterceptor = authInterceptor,
        _secureStorage = secureStorage,
        super(UserUnAuthorizedState()) {
    on<UserStateEvent>((event, emit) {
      switch (event) {
        case UserStateLoginEvent():
          emit(UserAuthorizedState());
        case UserStateLogOutEvent():
          return _logOut(event, emit);
      }
    });
  }

  FutureOr _logOut(
      UserStateLogOutEvent event, Emitter<UserStateState> emit) async {
    _authInterceptor.deleteCredentials();
    await _secureStorage.deleteUserData();
    emit(UserUnAuthorizedState());
  }
}
