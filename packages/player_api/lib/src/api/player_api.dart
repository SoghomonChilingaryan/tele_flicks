import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:player_api/player_api.dart';

part 'player_api.g.dart';

@RestApi()
abstract class PlayerApi {
  factory PlayerApi(Dio dio, {String baseUrl}) = _PlayerApi;

  @GET('/player_api.php')
  Future<AuthenticationResponse> authentication(
    @Query('username') String userName,
    @Query('password') String password,
  );

  @GET('/player_api.php')
  Future<List<LiveCategories>> getLiveCategories({
    @Query('action') String action = 'get_live_categories',
  });
}
// inorain2024
// inorain20242024