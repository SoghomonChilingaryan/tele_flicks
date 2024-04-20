part of 'live_tv_player_bloc.dart';

sealed class LiveTvPlayerState extends Equatable {
  const LiveTvPlayerState();
  
  @override
  List<Object> get props => [];
}

final class LiveTvPlayerInitial extends LiveTvPlayerState {}
