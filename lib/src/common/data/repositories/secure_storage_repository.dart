import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepository {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  static const _userName = 'userName';
  static const _password = 'password';

  Future<void> saveCredentials(String userName, String password) async {
    await _storage.write(key: _userName, value: userName);
    await _storage.write(key: _password, value: password);
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: _userName);
  }

  Future<String?> getPassword() async {
    return await _storage.read(key: _password);
  }

  Future<void> deleteUserData() async {
    await _storage.delete(key: _userName);
    await _storage.delete(key: _password);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
