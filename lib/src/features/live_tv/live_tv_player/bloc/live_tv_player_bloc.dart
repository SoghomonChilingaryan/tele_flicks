import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

part 'live_tv_player_event.dart';
part 'live_tv_player_state.dart';

class LiveTvPlayerBloc extends Bloc<LiveTvPlayerEvent, LiveTvPlayerState> {
  LiveTvPlayerBloc() : super(LiveTvPlayerInitialState()) {
    on<LiveTvPlayerAddEvent>((event, emit) {
      return _add(event, emit);
    }, transformer: droppable());
  }

  FutureOr _add(
      LiveTvPlayerAddEvent event, Emitter<LiveTvPlayerState> emit) async {
    emit(LiveTvPlayerInitialState());
    try {
      final controller = VideoPlayerController.networkUrl(Uri.parse(event.url));
      await Future.wait([
        controller.initialize(),
      ]);
      emit(LiveTvPlayerHaveControllerState(controller));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> close() {
    if (state is LiveTvPlayerHaveControllerState) {
      (state as LiveTvPlayerHaveControllerState).controller.dispose();
    }
    return super.close();
  }
}
