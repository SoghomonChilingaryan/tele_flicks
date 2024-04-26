part of 'live_tv_player_bloc.dart';

sealed class LiveTvPlayerState extends Equatable {
  const LiveTvPlayerState();

  @override
  List<Object> get props => [];
}

final class LiveTvPlayerInitialState extends LiveTvPlayerState {}

final class LiveTvPlayerHaveControllerState extends LiveTvPlayerState {
  final VideoPlayerController controller;

  LiveTvPlayerHaveControllerState(this.controller);
}
