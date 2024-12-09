import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as diox;
import 'package:flutter/material.dart';

import 'models/auth/request/user_credentials_rm.dart';
import 'models/auth/request/user_signup_rm.dart';
import 'models/auth/response/user_rm.dart';
import 'models/exceptions.dart';
import 'url_builder.dart';

typedef UserTokenSupplier = Future<String?> Function();

class MiraApi {
  static const _errorJsonKey = 'error';

  MiraApi({
    // required UserSlugSupplier userSlugSupplier,
    required UserTokenSupplier userTokenSupplier,
    required this.isUserUnAuthenticatedVN,
    required this.internetConnectionErrorVN,
  })  : urlBuilder = UrlBuilder(),
        _dio = Dio() {
    _dio.setUpAuthHeaders(
      // userSlugSupplier: userSlugSupplier,
      userTokenSupplier: userTokenSupplier,
      isUserUnAuthSC: isUserUnAuthenticatedVN,
      internetConnectionErrorVN: internetConnectionErrorVN,
    );
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: false,
        requestBody: false,
        requestHeader: false,
        responseBody: false,
        responseHeader: false,
        // logPrint: (_) {},
      ),
    );
  }

  // final FirebaseMessaging _firebaseMessaging;
  final Dio _dio;
  final ValueNotifier<bool> isUserUnAuthenticatedVN;
  final ValueNotifier internetConnectionErrorVN;
  final UrlBuilder urlBuilder;

  Future<UserRM> signIn({
    required String email,
    required String password,
  }) async {
    final url = urlBuilder.buildSignInUrl();

    final requestJsonBody = UserCredentialsRM(
      email: email,
      password: password,
    ).toJson();

    final response = await _dio.post(
      url,
      data: requestJsonBody,
    );
    try {
      final jsonObject = response.data;
      final user = UserRM.fromJson(jsonObject);
      return user;
    } catch (_) {
      final error = response.data[_errorJsonKey];
      final errorString = error.toString().toLowerCase();
      final invalidPassword = errorString.contains('password') == true;
      final invalidEmail = errorString.contains('user') == true;
      final invalidCredentials = invalidPassword || invalidEmail;
      if (invalidCredentials) {
        throw InvalidCredentialsMiraException();
      }
      rethrow;
    }
  }

  Future<UserRM> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    final url = urlBuilder.buildSignUpUrl();
    final requestJsonBody = UserSignUpRM(
      email: email,
      password: password,
      userName: userName,
    ).toJson();
    try {
      final response = await _dio.post(
        url,
        data: requestJsonBody,
      );
      final user = UserRM.fromJson(response.data);
      return user;
    } on DioException catch (error) {
      if (error.response?.data['message'].contains('البريد الالكتروني')) {
        throw (EmailAlreadyRegisteredMiraException);
      }

      rethrow;
    }
  }
}

extension on Dio {
  void setUpAuthHeaders({
    // required UserSlugSupplier userSlugSupplier,
    required UserTokenSupplier userTokenSupplier,
    required ValueNotifier<bool> isUserUnAuthSC,
    required ValueNotifier internetConnectionErrorVN,
  }) async {
    options = diox.BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    );
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await userTokenSupplier();
          options.headers.addAll(
            {"Accept": "application/json", "auth": token},
          );

          return handler.next(options);
        },
        onError: (error, handler) {
          final isCustomerUnAuth = error.response?.statusCode == 401;
          final internetConnectionError =
              error.type == DioExceptionType.connectionError;
          if (isCustomerUnAuth) isUserUnAuthSC.value = (true);
          if (internetConnectionError) {
            final internetConnectionException =
                InternetConnectionMiraException();
            internetConnectionErrorVN.value = internetConnectionException;
            internetConnectionErrorVN.value = null;
          }
          return handler.next(error);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
      ),
    );
  }
}
