// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'live_tv_menu_bloc.dart';

class LiveTvMenuState extends Equatable {
  final List<LiveCategories> category;
  final List<LiveStream> liveStreams;
  final String currantCategoryId;
  const LiveTvMenuState({
    this.category = const [],
    this.liveStreams = const [],
    this.currantCategoryId = '',
  });

  @override
  List<Object> get props => [
        category,
        liveStreams,
        currantCategoryId,
      ];

  LiveTvMenuState copyWith({
    List<LiveCategories>? category,
    List<LiveStream>? liveStreams,
    String? currantCategoryId,
  }) {
    return LiveTvMenuState(
      category: category ?? this.category,
      liveStreams: liveStreams ?? this.liveStreams,
      currantCategoryId: currantCategoryId ?? this.currantCategoryId,
    );
  }
}
