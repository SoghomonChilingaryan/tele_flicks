part of 'live_tv_menu_bloc.dart';

sealed class LiveTvMenuEvent extends Equatable {
  const LiveTvMenuEvent();

  @override
  List<Object> get props => [];
}

// final class LiveTvMenuGetLiveCategoriesEvent extends LiveTvMenuEvent{}
final class LiveTvMenuCreateInitialStateEvent extends LiveTvMenuEvent {}

final class LiveTvMenuOnCategoryPressEvent extends LiveTvMenuEvent {
  final String categoryId;

  LiveTvMenuOnCategoryPressEvent(this.categoryId);
}

class LiveTvMenuOnLiveStreamPressEvent extends LiveTvMenuEvent {
  final int streamId;

  LiveTvMenuOnLiveStreamPressEvent(this.streamId);
}
