part of 'live_tv_player_bloc.dart';

sealed class LiveTvPlayerEvent extends Equatable {
  const LiveTvPlayerEvent();

  @override
  List<Object> get props => [];
}

class LiveTvPlayerAddEvent extends LiveTvPlayerEvent {
  final String url;

  LiveTvPlayerAddEvent(this.url);
}
