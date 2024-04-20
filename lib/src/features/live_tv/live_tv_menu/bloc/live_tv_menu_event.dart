part of 'live_tv_menu_bloc.dart';

sealed class LiveTvMenuEvent extends Equatable {
  const LiveTvMenuEvent();

  @override
  List<Object> get props => [];
}

final class LiveTvMenuGetLiveCategoriesEvent extends LiveTvMenuEvent{}
final class LiveTvMenuOnCategoryPressEvent extends LiveTvMenuEvent{
  final String categoryId;

  LiveTvMenuOnCategoryPressEvent(this.categoryId);

}