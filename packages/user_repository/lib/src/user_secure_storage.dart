import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _tokenKey = 'user-token';
  static const _passwordKey = 'user-password';
  static const _rememberPhoneKey = 'remember-email';
  static const _rememberEmailKey = 'remember-email';
  static const _rememberPasswordKey = 'remember-password';
  static const _userKey = 'user';
  static const _userNameKey = 'user-name';
  static const _userIdKey = 'user-id';


  const UserSecureStorage({
    FlutterSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  Future<void> upsertUserInfo({required String user}) async {
    await _secureStorage.write(
      key: _userKey,
      value: user,
    );
  }



  Future<String?> getUserInfo() async {
    return await _secureStorage.read(key: _userKey);
  }

  Future<void> deleteUser() async => await _secureStorage.delete(key: _userKey);

  Future<void> setUserToken({required String? token}) async {
    await _secureStorage.write(
      key: _tokenKey,
      value: token,
    );
  }

  Future<String?> getUserToken() => _secureStorage.read(
    key: _tokenKey,
  );
  Future<String?> getUserName() => _secureStorage.read(
    key: _userNameKey,
  );

  Future<String?> getUserId() => _secureStorage.read(
    key: _userIdKey,
  );
  Future<void> deleteUserToken() async =>
      await _secureStorage.delete(key: _tokenKey);

  Future<void> upsertUserPassword({required String? password}) async {
    await _secureStorage.write(
      key: _passwordKey,
      value: password,
    );
  }

  Future<String?> getUserPassword() => _secureStorage.read(
    key: _passwordKey,
  );

  Future<void> deleteUserPassword() async =>
      await _secureStorage.delete(key: _passwordKey);


  Future<void> upsertRememberPhone({required String? phone}) async {
    await _secureStorage.write(
      key: _rememberPhoneKey,
      value: phone,
    );
  }

  Future<String?> getRememberPhone() => _secureStorage.read(
    key: _rememberPhoneKey,
  );

  Future<void> deleteRememberPhone() async =>
      await _secureStorage.delete(key: _rememberPhoneKey);

  Future<void> upsertRememberEmail({required String? email}) async {
    await _secureStorage.write(
      key: _rememberEmailKey,
      value: email,
    );
  }

  Future<String?> getRememberEmail() => _secureStorage.read(
    key: _rememberEmailKey,
  );

  Future<void> deleteRememberEmail() async =>
      await _secureStorage.delete(key: _rememberEmailKey);


  Future<void> upsertRememberPassword({required String? password}) async {
    await _secureStorage.write(
      key: _rememberPasswordKey,
      value: password,
    );
  }

  Future<String?> getRememberPassword() => _secureStorage.read(
    key: _rememberPasswordKey,
  );

  Future<void> deleteRememberPassword() async =>
      await _secureStorage.delete(key: _rememberPasswordKey);
}
