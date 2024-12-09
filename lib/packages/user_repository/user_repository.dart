import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mira/packages/domain_models/domain_models.dart';
import 'package:mira/packages/key_value_storage/key_value_storage.dart';
import 'package:mira/packages/mira_api/mira_api.dart';
import 'package:mira/packages/mira_api/models/exceptions.dart';
import 'package:mira/packages/user_repository/user_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository {
  UserRepository({
    required KeyValueStorage noSqlStorage,
    required this.remoteApi,
  }) : _secureStorage = const UserSecureStorage();

  final MiraApi remoteApi;
  final UserSecureStorage _secureStorage;
  final BehaviorSubject<User?> _userSubject = BehaviorSubject();
  final ValueNotifier<bool?> signInSuccessVN = ValueNotifier(null);
  User? user;

  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      await remoteApi.signIn(
        email: email,
        password: password,
      );
      // final user = userRM.toDomainModel();
      //
      // _userSubject.add(user);
      // final userCM = userRM.toCacheModel();
      // print(userCM);
    } catch (error) {
      if (error is InvalidCredentialsMiraException) {
        throw InvalidCredentialsException();
      }
      if (error is InvalidEmailFormatMiraException) {
        throw InvalidEmailFormatException();
      }
      rethrow;
    }
  }

  Future signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final apiUser = await remoteApi.signUp(
        email: email,
        password: password,
        userName: userName,
      );
      // final userCM = apiUser.toCacheModel();
      // await storeUserOnCache(
      //   userCM: userCM,
      // );
      // final domainUser = apiUser.toDomainModel();
      // return domainUser;
    } catch (error) {
      if (error is EmailAlreadyRegisteredMiraException) {
        throw EmailAlreadyRegisteredException();
      }
      if (error is InvalidEmailFormatSehatakException) {
        throw InvalidEmailFormatException();
      }
      rethrow;
    }
  }

  Future<User> registerAndLogin({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      // Step 1: Register the user
      final newUser = await signUp(
        email: email,
        password: password,
        userName: userName,
      );

      // Step 2: Log in the user with the same credentials
      final loggedInUser = await signIn(
        // Use a new variable name for clarity
        email: email,
        password: password,
      );

      // Step 3: Return the logged-in user
      return loggedInUser;
    } catch (error) {
      rethrow; // Re-throw the error to handle it in the calling function
    }
  }

  Future<String?> getUserToken() async => await _secureStorage.getUserToken();

  Future logout() async {
    try {
      await _secureStorage.deleteUser();
      _userSubject.add(null);
    } catch (error) {
      rethrow;
    }
  }

  Stream<User?> getUser() async* {
    // Check if there is a [User] value added to the stream, if not,
    // this means that we need to first get the [User] data from
    // the secure storage in order to be able to add a [User].
    // if (!_userSubject.hasValue) {
    final userId = await _secureStorage.getUserId();
    final userName = await _secureStorage.getUserName();
    final userToken = await _secureStorage.getUserToken();
    if (userId != null && userName != null && userToken != null) {
      final user = User(
        // id: int.parse(userId),
        name: userName,
      );
      _userSubject.add(user);
    } else {
      _userSubject.add(null);
    }
    yield* _userSubject.stream;
  }

  Future cacheRememberedCredentials({
    required String email,
    required String password,
  }) async {
    await _secureStorage.upsertRememberEmail(email: email);
    await _secureStorage.upsertRememberPassword(password: password);
  }

  Future deleteRememberedCredentials() async {
    await _secureStorage.deleteRememberEmail();
    await _secureStorage.deleteRememberPassword();
  }
}
