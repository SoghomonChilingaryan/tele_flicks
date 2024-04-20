part of 'user_state_bloc.dart';

sealed class UserStateEvent extends Equatable {
  const UserStateEvent();

  @override
  List<Object> get props => [];
}

class UserStateLoginEvent extends UserStateEvent {}
class UserStateLogOutEvent extends UserStateEvent {}
