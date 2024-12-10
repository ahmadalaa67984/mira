import 'dart:async';
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:domain_models/domain_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:function_and_extension_library/function_and_extension_library.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'package:mira_api/mira_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/src/mappers/mappers.dart';
import 'package:user_repository/src/user_change_notifier.dart';
import 'package:user_repository/src/user_local_storage.dart';
import 'package:user_repository/src/user_secure_storage.dart';

class UserRepository {
  UserRepository({
    required KeyValueStorage noSqlStorage,
    required this.remoteApi,
  })  : _secureStorage = const UserSecureStorage(),
        changeNotifier = UserChangeNotifier(),
        _localStorage = UserLocalStorage(noSqlStorage: noSqlStorage);

  final MiraApi remoteApi;
  final UserSecureStorage _secureStorage;
  final UserLocalStorage _localStorage;
  final BehaviorSubject<User?> _userSubject = BehaviorSubject();
  final ValueNotifier<bool?> signInSuccessVN=ValueNotifier(null);
  final UserChangeNotifier changeNotifier;
   User? user;

  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userRM = await remoteApi.signIn(
        email: email,
        password: password,
      );
      final user=userRM.toDomainModel();
      // await _secureStorage.upsertUser(
      //   id: userRM.id,
      //   name: userRM.name ?? 'nameRM',
      //   email: userRM.email,
      //   phone: userRM.phone,
      //   token: userRM.token!,
      // );
      // final isUserExpired = await remoteApi.getIsUserExpired();
      // if (isUserExpired) {
      //   throw UserExpiredException();
      // }
      _userSubject.add(
          user
      );
      final userCM = userRM.toCacheModel();
      print(userCM);
      // await storeUserOnCache(
      //   userCM: userCM,
      // );
      // signInSuccessVN.value=true;
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

  Future<User> signUp({
    required String email,
    required String password,
    required String userName
  }) async {
    try {
      final apiUser = await remoteApi.signUp(
        email: email,
        password: password,
        userName:userName
      );
      // final userCM = apiUser.toCacheModel();
      // await storeUserOnCache(
      //   userCM: userCM,
      // );
      print(apiUser);
      final domainUser = apiUser.toDomainModel();
      return domainUser;
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
      final loggedInUser = await signIn( // Use a new variable name for clarity
        email: email,
        password: password,
      );

      // Step 3: Return the logged-in user
      return loggedInUser;
    } catch (error) {
      rethrow; // Re-throw the error to handle it in the calling function
    }
  }
  Future storeUserOnCache({
    required String userCM,
    String? userPassword,
    String? userToken,
  }) async {
    try {
      await _secureStorage.upsertUserInfo(user: userCM);
      // final domainUser = userCacheToDomainModel(userCM);
      await _secureStorage.deleteUserToken();
      await _secureStorage.setUserToken(token: userToken);
      await _secureStorage.deleteUserPassword();
      await _secureStorage.upsertUserPassword(password: userPassword);
      // _userSubject.add(domainUser);
    } catch (error) {
      rethrow;
    }
  }
  // Future changePassword({
  //   required String oldPassword,
  //   required String newPassword,
  // }) async {
  //   try {
  //     final user = await getUser().first;
  //     await remoteApi.changePassword(
  //       email: user!.email!,
  //       oldPassword: oldPassword,
  //       newPassword: newPassword,
  //     );
  //   } catch (error) {
  //     if (error is IncorrectPasswordMiraException) {
  //       throw WrongPasswordException();
  //     }
  //     rethrow;
  //   }
  // }

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
    final userToken=await _secureStorage.getUserToken();
    if (userId != null && userName != null && userToken != null) {
      final user = User(
        // id: int.parse(userId),
        username: userName,
      );
      _userSubject.add(user);
    } else {
      _userSubject.add(null);
    }
    yield* _userSubject.stream;
  }
  //
  // Future<String?> getUserSlug() => _secureStorage.getUserSlug();

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
