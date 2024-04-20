part of 'user_state_bloc.dart';

sealed class UserStateState extends Equatable {
  const UserStateState();
  
  @override
  List<Object> get props => [];
}

final class UserUnAuthorizedState extends UserStateState {}
final class UserAuthorizedState extends UserStateState {}
