import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_tv_player_event.dart';
part 'live_tv_player_state.dart';

class LiveTvPlayerBloc extends Bloc<LiveTvPlayerEvent, LiveTvPlayerState> {
  LiveTvPlayerBloc() : super(LiveTvPlayerInitial()) {
    on<LiveTvPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
