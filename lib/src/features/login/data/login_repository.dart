import 'package:player_api/player_api.dart';
import 'package:tele_flicks/src/common/core/interceptors/auth_interceptor.dart';
import 'package:tele_flicks/src/common/data/repositories/secure_storage_repository.dart';

class LoginRepository {
  final PlayerApi _playerApi;
  final AuthInterceptor _authInterceptor;
  final SecureStorageRepository _secureStorage;
  LoginRepository({
    required PlayerApi playerApi,
    required AuthInterceptor authInterceptor,
    required SecureStorageRepository secureStorage,
  })  : _playerApi = playerApi,
        _authInterceptor = authInterceptor,
        _secureStorage = secureStorage;

  Future<(String, String)?> getUserLocalData() async {
    final userName = await _secureStorage.getUserName();
    final password = await _secureStorage.getPassword();
    if (userName != null &&
        password != null &&
        userName.isNotEmpty &&
        password.isNotEmpty) {
      return (userName, password);
    }
    return null;
  }

  Future<bool> authentication({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await _playerApi.authentication(userName, password);
      if (response.userInfo.userState != null &&
          response.userInfo.userState == UserState.authorized) {
        _authInterceptor.updateCredentials(
          response.userInfo.userName,
          response.userInfo.password,
        );
        return true;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return false;
  }

  Future<void> changeLocalUserData({
    required String userName,
    required String password,
  }) async {
    await _secureStorage.saveCredentials(userName, password);
  }
}
