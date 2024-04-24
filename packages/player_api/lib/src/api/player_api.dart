import 'package:dio/dio.dart';
import 'package:player_api/player_api.dart';
import 'package:retrofit/retrofit.dart';

part 'player_api.g.dart';

// inorain2024
// inorain20242024
@RestApi()
abstract class PlayerApi {
  factory PlayerApi(Dio dio, {String baseUrl}) = _PlayerApi;

  @GET('/player_api.php')
  Future<AuthenticationResponse> authentication(
    @Query('username') String userName,
    @Query('password') String password,
  );

// LiveCategories
  @GET('/player_api.php')
  Future<List<LiveCategoriesResponse>> getLiveCategories({
    @Query('action') String action = 'get_live_categories',
  });

  @GET('/player_api.php')
  Future<List<LiveStreamsResponse>> getLiveStreams({
    @Query('action') String action = 'get_live_streams',
  });

  @GET('/player_api.php')
  Future<List<LiveStreamsResponse>> getLiveStreamsCategoryId({
    @Query('action') String action = 'get_live_streams',
    @Query('category_id') required String categoryId,
  });

  @GET('/player_api.php')
  Future<ShortEpgResponse> getShortEpg({
    @Query('action') String action = 'get_short_epg',
    @Query('stream_id') required int streamId,
  });

// // VodCategories
//   @GET('/player_api.php')
//   Future<List<LiveCategoriesResponse>> getVodCategories({
//     @Query('action') String action = 'get_vod_categories',
//   });

//   @GET('/player_api.php')
//   Future<List<LiveStreamsResponse>> getVoidStreams({
//     @Query('action') String action = 'get_vod_streams',
//   });

//   @GET('/player_api.php')
//   Future<List<LiveStreamsResponse>> getVoidStreamsCategoryId({
//     @Query('action') String action = 'get_vod_streams',
//     @Query('category_id') required String categoryId,
//   });

// // SeriesCategories
//   @GET('/player_api.php')
//   Future<List<LiveCategoriesResponse>> getSeriesCategories({
//     @Query('action') String action = 'get_series_categories',
//   });

//   @GET('/player_api.php')
//   Future<List<LiveStreamsResponse>> getSeries({
//     @Query('action') String action = 'get_series',
//   });

//   @GET('/player_api.php')
//   Future<List<LiveStreamsResponse>> getSeriesCategoryId({
//     @Query('action') String action = 'get_series',
//     @Query('category_id') required String categoryId,
//   });
}
