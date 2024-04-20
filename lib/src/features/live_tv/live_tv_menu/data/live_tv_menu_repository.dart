import 'package:player_api/player_api.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/domain/live_categories.dart';

class LiveTvMenuRepository {
  final PlayerApi _playerApi;

  LiveTvMenuRepository({
    required PlayerApi playerApi,
  }) : _playerApi = playerApi;

  Future<List<LiveCategories>> getLiveCategories() async {
    try {
      List<LiveCategories> category = [];
      final liveCategories = await _playerApi.getLiveCategories();
      category.addAll(liveCategories
          .map((e) => LiveCategories(
                categoryId: e.categoryId,
                categoryName: e.categoryName,
                parentId: e.parentId,
              ))
          .toList());
      // final voidCategories = await _playerApi.getVodCategories();
      // category.addAll(voidCategories
      //     .map((e) => LiveCategories(
      //           categoryId: e.categoryId,
      //           categoryName: e.categoryName,
      //           parentId: e.parentId,
      //         ))
      //     .toList());
      // final seriesCategories = await _playerApi.getSeriesCategories();
      // category.addAll(seriesCategories
      //     .map((e) => LiveCategories(
      //           categoryId: e.categoryId,
      //           categoryName: e.categoryName,
      //           parentId: e.parentId,
      //         ))
      //     .toList());

      return category;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getLiveStreamsCategoryId(
      {required String categoryId}) async {
    try {
      final liveStreams =
          await _playerApi.getLiveStreamsCategoryId(categoryId: categoryId);
      return liveStreams;
    } catch (e) {}
    return [];
  }
}
