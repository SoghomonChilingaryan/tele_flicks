import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tele_flicks/src/features/app_progress/app_progress_bloc.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/domain/live_categories.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/data/live_tv_menu_repository.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_player/bloc/live_tv_player_bloc.dart';

part 'live_tv_menu_event.dart';
part 'live_tv_menu_state.dart';

class LiveTvMenuBloc extends Bloc<LiveTvMenuEvent, LiveTvMenuState> {
  final LiveTvMenuRepository _repository;
  final AppProgressBloc _progressBloc;
  final LiveTvPlayerBloc _liveTvPlayerBloc;
  LiveTvMenuBloc(
      {required LiveTvMenuRepository repository,
      required AppProgressBloc progressBloc,
      required LiveTvPlayerBloc liveTvPlayerBloc})
      : _repository = repository,
        _progressBloc = progressBloc,
        _liveTvPlayerBloc = liveTvPlayerBloc,
        super(LiveTvMenuState()) {
    on<LiveTvMenuEvent>((event, emit) {
      switch (event) {
        case LiveTvMenuGetLiveCategoriesEvent():
          return _getLiveCategories(event, emit);
        case LiveTvMenuOnCategoryPressEvent():
          return _onCategoryPress(event, emit);
      }
    });
  }

  Future<void> _getLiveCategories(LiveTvMenuGetLiveCategoriesEvent event,
      Emitter<LiveTvMenuState> emit) async {
    _progressBloc.add(AppProgressChangeProgressEvent(true));
    try {
      final category = await _repository.getLiveCategories();
      if (category.isNotEmpty) {
        emit(state.copyWith(category: category));
      }
    } catch (e) {}
    _progressBloc.add(AppProgressChangeProgressEvent(false));
  }

  Future<void> _onCategoryPress(LiveTvMenuOnCategoryPressEvent event,
      Emitter<LiveTvMenuState> emit) async {
    final liveStreams = await _repository.getLiveStreamsCategoryId(
        categoryId: event.categoryId);
        
  }
}
