// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'live_tv_menu_bloc.dart';

class LiveTvMenuState extends Equatable {
  final List<LiveCategories> category;
  const LiveTvMenuState({
    this.category = const [],
  });

  @override
  List<Object> get props => [
        category,
      ];

  LiveTvMenuState copyWith({
    List<LiveCategories>? category,
  }) {
    return LiveTvMenuState(
      category: category ?? this.category,
    );
  }
}
