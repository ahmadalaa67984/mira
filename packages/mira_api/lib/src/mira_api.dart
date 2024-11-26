import 'dart:async';

import 'package:mira_api/mira_api.dart';
import 'package:mira_api/src/models/task/request/create_task_rm.dart';
import 'package:mira_api/src/url_builder.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as diox;
import 'package:flutter/material.dart';

import 'models/auth/request/update_account_rm.dart';

typedef UserSlugSupplier = Future<String?> Function();
typedef UserTokenSupplier = Future<String?> Function();

class MiraApi {
  static const _errorJsonKey = 'error';
  static const _dataJsonKey = 'data';
  static const _jobTitlesJsonKey = 'jobs';
  static const _stagesJsonKey = 'stage';
  static const _prioritiesJsonKey = 'priority';
  static const _statusJsonKey = 'status';
  static const _usersJsonKey = 'users';
  static const _tasksJsonKey = 'tasks';
  static const _contactsJsonKey = 'contacts';
  static const _contactJsonKey = 'contact';
  static const _dealsJsonKey = 'deals';
  static const _dealJsonKey = 'deal';
  static const _companiesJsonKey = 'companies';
  static const _companyJsonKey = 'company';
  static const _successJsonKey = 'success';
  static const _customFieldsJsonKey = 'custom_fields';

  MiraApi({
    // required UserSlugSupplier userSlugSupplier,
    required UserTokenSupplier userTokenSupplier,
    required this.isUserUnAuthenticatedVN,
    required this.internetConnectionErrorVN,
    required this.isUserExpiredVN,
  })  : urlBuilder = UrlBuilder(),
        _dio = Dio() {
    _dio.setUpAuthHeaders(
      // userSlugSupplier: userSlugSupplier,
      userTokenSupplier: userTokenSupplier,
      isUserUnAuthSC: isUserUnAuthenticatedVN,
      internetConnectionErrorVN: internetConnectionErrorVN,
      isUserExpiredVN: isUserExpiredVN,
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
  final ValueNotifier isUserExpiredVN;
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
    // required String companyName,
    // required String countryCode,
    // required String productsList,
    // required String phone,
    // required String name,
    // required String companySector,
    // required String phone,
    // required String name,
    // required String city,
    // required String birthdate,
    // required String gender,
  }) async {
    final url = urlBuilder.buildSignUpUrl();
    final requestJsonBody = UserSignUpRM(
      email: email,
      password: password,
      userName: userName
    ).toJson();
    try {
      final response = await _dio.post(
        url,
        data: requestJsonBody,
      );
      print('Response data: ${response.data}');
      final user = UserRM.fromJson(response.data);
     return user;
    } on DioException catch (error) {print(error.response?.data);
      if(error.response?.data['message'].contains('البريد الالكتروني'))
        {
         throw(EmailAlreadyRegisteredMiraException);
        };
      rethrow;
    }
  }


  Future<bool> getIsUserExpired() async {
    final url = urlBuilder.buildGetAllJobTitlesUrl();

    try {
      final response = await _dio.get(
        url,
      );
      final isExpired = response.data is String &&
          response.data.contains('Expired Membership');

      return isExpired;
    } catch (_) {
      rethrow;
    }
  }

  Future updateProfile({
    required int userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? jobTitle,
    String? image,
  }) async {
    final url = urlBuilder.buildUpdateUserUrl();

    final requestJsonBody = UpdateProfileUpRM(
      id: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      jobTitle: jobTitle,
      image: image,
    ).toJson();

    try {
      await _dio.post(
        url,
        data: requestJsonBody,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future updateAccount({
    required int userId,
    String? accountName,
    String? companyName,
    String? companyAddress,
    String? companyCountry,
  }) async {
    final url = urlBuilder.buildUpdateAccountUrl();

    final requestJsonBody = UpdateAccountRM(
      id: userId,
      accountName: accountName,
      companyName: companyName,
      companyAddress: companyAddress,
      companyCountry: companyCountry,
    ).toJson();

    try {
      await _dio.post(
        url,
        data: requestJsonBody,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    final url = urlBuilder.buildChangePasswordUrl();

    final requestJsonBody = ChangePasswordRM(
      email: email,
      oldPassword: oldPassword,
      newPassword: newPassword,
    ).toJson();

    try {
      final response = await _dio.post(
        url,
        data: requestJsonBody,
      );
      final responseValue = response.data[_errorJsonKey];
      if (responseValue is String &&
          responseValue.toLowerCase().contains('token invalid')) {
        throw IncorrectPasswordMiraException();
      }
    } catch (_) {
      rethrow;
    }
  }

  Future addComment({
    required int activityId,
    required String comment,
    required int userId,
  }) async {
    final url = urlBuilder.buildAddCommentUrl();

    final requestJsonBody = CommentRequestRM(
      activityId: activityId,
      content: comment,
      userId: userId,
    ).toJson();

    try {
      await _dio.post(
        url,
        data: requestJsonBody,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future addActivity({
    required String title,
    String? description,
    String? date,
    required String logType,
    String? contactId,
    String? companyName,
    String? dealName,
    String? taskId,
    String? note,
  }) async {
    final url = urlBuilder.buildAddActivityUrl();

    final requestJsonBody = AddActivityRM(
      name: title,
      description: description,
      date: date,
      logType: logType,
      contactId: contactId,
      companyName: companyName,
      dealName: dealName,
      taskId: taskId,
    ).toJson();

    try {
      await _dio.post(
        url,
        data: requestJsonBody,
      );
    } catch (_) {
      rethrow;
    }
  }

  Future addNote({
    required String description,
    String? contactId,
    String? companyId,
    String? dealId,
    String? taskId,
  }) async {
    final url = urlBuilder.buildAddNoteUrl();

    final requestJsonBody = AddNoteRM(
      description: description,
      contactId: contactId,
      companyName: companyId,
      dealName: dealId,
      taskId: taskId,
    ).toJson();

    try {
      await _dio.post(
        url,
        data: requestJsonBody,
      );
    } catch (_) {
      rethrow;
    }
  }

  // Task functions
  Future<TaskListPageRM> getTaskListPage({
    int pageNumber = 1,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    String? assignee,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final url = urlBuilder.buildGetTasksUrl(
        pageNumber: pageNumber,
        searchText: searchText,
        sortBy: sortBy,
        archived: archived,
        creatorId: creatorId,
        assignee: assignee,
        startDate: startDate,
        endDate: endDate,
      );

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final tasks = TaskListPageRM.fromJson(jsonObject);

      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskRM> getTask(int id) async {
    try {
      final url = urlBuilder.buildGetTaskUrl(id);

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final tasks = TaskRM.fromJson(jsonObject);

      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> createOrUpdateTask({
    String? id,
    required String name,
    required String startDate,
    required String endDate,
    required String type,
    String? assigneeId,
    String? priority,
    required List<int> taskCollaboratorsIds,
    required String description,
    String? companyName,
    String? dealName,
    String? contactId,
  }) async {
    final url = id != null
        ? urlBuilder.buildUpdateTaskUrl()
        : urlBuilder.buildCreateTaskUrl();
    final requestJsonBody = CreateOrUpdateTaskRM(
      id: id,
      name: name,
      startDate: startDate,
      endDate: endDate,
      priority: priority,
      collaborators: taskCollaboratorsIds,
      description: description,
      companyName: companyName,
      dealName: dealName,
      contactId: contactId,
      assigneeId: assigneeId,
      type: type,
    ).toJson();
    // debugPrint(requestJsonBody.toString());
    try {
      final response = await _dio.post(
        url,
        data: requestJsonBody,
      );
      final responseValue = response.data[_successJsonKey];
      final taskId = responseValue as int?;
      return taskId;
    } catch (error) {
      rethrow;
    }
  }

  Future massDeleteTasks(String ids) async {
    final url = urlBuilder.buildMassDeleteTasksUrl();

    try {
      await _dio.post(
        url,
        data: {'ids': ids},
      );
    } catch (error) {
      rethrow;
    }
  }

  // Contact functions
  Future<ContactListPageRM> getContactListPage({
    int pageNumber = 1,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    String? jobTitle,
    String? lifeCycle,
    String? priority,
    String? activeInactiveStatus,
  }) async {
    try {
      final url = urlBuilder.buildGetContactsUrl(
        pageNumber: pageNumber,
        searchText: searchText,
        sortBy: sortBy,
        archived: archived,
        creatorId: creatorId,
        jobTitle: jobTitle,
        lifeCycle: lifeCycle,
        priority: priority,
        activeInactiveStatus: activeInactiveStatus,
      );

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final contacts = ContactListPageRM.fromJson(jsonObject);

      return contacts;
    } catch (e) {
      rethrow;
    }
  }

  Future<ContactRM> getContact(int id) async {
    try {
      final url = urlBuilder.buildGetContactUrl(id);

      final response = await _dio.get(url);

      final jsonObject = response.data[_contactJsonKey];
      final contact = ContactRM.fromJson(jsonObject);

      return contact;
    } catch (e) {
      rethrow;
    }
  }

  Future massDeleteContacts(String ids) async {
    final url = urlBuilder.buildMassDeleteContactsUrl();

    try {
      await _dio.post(
        url,
        data: {'ids': ids},
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<int?> createOrUpdateContact({
    String? id,
    required String name,
    required String lastName,
    required String email,
    required String phone,
    String? jobTitle,
    String? note,
    String? owner,
    String? lifeCycle,
    String? company,
    String? priority,
    List<int>? followers,
    String? status,
    String? dealName,
    Map<String, dynamic>? customFields,
  }) async {
    final url = id != null
        ? urlBuilder.buildUpdateContactUrl()
        : urlBuilder.buildCreateContactUrl();
    final requestJsonBody = CreateOrUpdateContactRM(
      id: id,
      name: name,
      lastName: lastName,
      email: email,
      phone: phone,
      jobTitle: jobTitle,
      note: note,
      owner: owner,
      lifeCycle: lifeCycle,
      company: company,
      priority: priority,
      followers: followers,
      status: status,
      dealName: dealName,
    ).toJson();
    if (customFields != null) requestJsonBody.addAll(customFields);

    try {
      final response = await _dio.post(
        url,
        data: requestJsonBody,
      );
      final responseValue = response.data[_successJsonKey];
      final contactId = responseValue as int?;
      return contactId;
    } catch (error) {
      rethrow;
    }
  }

  // Deal functions
  Future<DealListPageRM> getDealListPage({
    int pageNumber = 1,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    int? dealStageId,
  }) async {
    try {
      final url = urlBuilder.buildGetDealsUrl(
        pageNumber: pageNumber,
        searchText: searchText,
        // sortBy: sortBy,
        archived: archived,
        creatorId: creatorId,
        dealStageId: dealStageId,
      );

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final deals = DealListPageRM.fromJson(jsonObject);

      return deals;
    } catch (e) {
      rethrow;
    }
  }

  Future<SingleDealRM> getDeal(int id) async {
    try {
      final url = urlBuilder.buildGetDealUrl(id);

      final response = await _dio.get(url);

      final jsonObject = response.data[_dealJsonKey];
      final deal = SingleDealRM.fromJson(jsonObject);

      return deal;
    } catch (e) {
      rethrow;
    }
  }

  Future massDeleteDeals(String ids) async {
    final url = urlBuilder.buildMassDeleteCompaniesUrl();

    try {
      await _dio.post(
        url,
        data: {'ids': ids},
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<int?> createOrUpdateDeal({
    String? id,
    required String name,
    String? startDate,
    String? endDate,
    double? value,
    List<int>? watcherId,
    required int ownerId,
    int? stageId,
    required int companyId,
    required int contactId,
    double? cr,
    int? vat,
    Map<String, dynamic>? customFields,
  }) async {
    final url = id != null
        ? urlBuilder.buildUpdateDealUrl()
        : urlBuilder.buildCreateDealUrl();
    final requestJsonBody = CreateOrUpdateDealRM(
      id: id,
      name: name,
      startDate: startDate,
      endDate: endDate,
      value: value,
      followers: watcherId,
      ownerId: ownerId,
      stageId: stageId,
      companyId: companyId,
      contactId: contactId,
      cr: cr,
      vat: vat,
    ).toJson();
    if (customFields != null) requestJsonBody.addAll(customFields);
    try {
      final response = await _dio.post(
        url,
        data: requestJsonBody,
      );
      final responseValue = response.data[_dataJsonKey];
      if (responseValue is String &&
          responseValue.toLowerCase().contains('already exists')) {
        throw DuplicateNameMiraException();
      }
      final dealId = response.data[_dataJsonKey];
      return dealId;
    } catch (error) {
      rethrow;
    }
  }

  // Company functions
  Future<CompanyListPageRM> getCompanyListPage({
    int pageNumber = 1,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    String? jobTitle,
    String? lifeCycle,
    String? priority,
  }) async {
    try {
      final url = urlBuilder.buildGetCompaniesUrl(
        pageNumber: pageNumber,
        searchText: searchText,
        sortBy: sortBy,
        archived: archived,
        creatorId: creatorId,
        jobTitle: jobTitle,
        lifeCycle: lifeCycle,
        priority: priority,
      );

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final companies = CompanyListPageRM.fromJson(jsonObject);

      return companies;
    } catch (e) {
      rethrow;
    }
  }

  Future<CompanyRM> getCompany(int id) async {
    try {
      final url = urlBuilder.buildGetCompanyUrl(id);

      final response = await _dio.get(url);

      final jsonObject = response.data[_companyJsonKey];
      final company = CompanyRM.fromJson(jsonObject);

      return company;
    } catch (e) {
      rethrow;
    }
  }

  Future massDeleteCompanies(String ids) async {
    final url = urlBuilder.buildMassDeleteCompaniesUrl();

    try {
      await _dio.post(
        url,
        data: {'ids': ids},
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<int?> createOrUpdateCompany({
    String? id,
    required String name,
    String? website,
    String? phone,
    required String email,
    required int ownerId,
    String? status,
    String? lifeCycle,
    String? priority,
    String? contactId,
    String? dealId,
    List<int>? followers,
    String? description,
    String? facebook,
    String? instagram,
    String? linkedIn,
    String? twitter,
    String? snapchat,
    String? tiktok,
    Map<String, dynamic>? customFields,
  }) async {
    final url = id != null
        ? urlBuilder.buildUpdateCompanyUrl()
        : urlBuilder.buildCreateCompanyUrl();
    final requestJsonBody = CreateOrUpdateCompanyRM(
      id: id,
      name: name,
      website: website,
      phone: phone,
      email: email,
      ownerId: ownerId,
      status: status,
      priority: priority,
      contactId: contactId,
      dealId: dealId,
      followers: followers,
      lifeCycle: lifeCycle,
      description: description,
      brief: description,
      facebook: facebook,
      instagram: instagram,
      linkedIn: linkedIn,
      twitter: twitter,
      snapchat: snapchat,
      tiktok: tiktok,
    ).toJson();
    if (customFields != null) requestJsonBody.addAll(customFields);

    try {
      final response = await _dio.post(
        url,
        data: requestJsonBody,
      );
      final responseValue = response.data[_dataJsonKey];
      if (responseValue is String &&
          responseValue.toLowerCase().contains('already exists')) {
        throw DuplicateNameMiraException();
      }
      final companyId = response.data[_successJsonKey];
      return companyId;
    } catch (error) {
      rethrow;
    }
  }

  // App dependencies
  Future<List<String>> getAllJobTitles() async {
    try {
      final url = urlBuilder.buildGetAllJobTitlesUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final jobTitles = (jsonObject[_jobTitlesJsonKey] as List)
          .map((jobTitle) => jobTitle.toString())
          .toList();

      return jobTitles;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DealStageRM>> getAllDealStages() async {
    try {
      final url = urlBuilder.buildGetAllStagesUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final stages = (jsonObject[_stagesJsonKey] as List)
          .map((stage) => DealStageRM.fromJson(stage))
          .toList();

      return stages;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getAllPriorities() async {
    try {
      final url = urlBuilder.buildGetAllPrioritiesUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final priorities = (jsonObject[_prioritiesJsonKey] as List)
          .map((priority) => priority.toString())
          .toList();

      return priorities;
    } catch (e) {
      rethrow;
    }
  }

  Future<LifeCyclesRM> getAllLifeCycles() async {
    try {
      final url = urlBuilder.buildGetAllLifeCyclesUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final lifeCycles = LifeCyclesRM.fromJson(jsonObject);

      return lifeCycles;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getAllStatus() async {
    try {
      final url = urlBuilder.buildGetAllStatusUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final lifeCycles = (jsonObject[_statusJsonKey] as List)
          .map((status) => status.toString())
          .toList();

      return lifeCycles;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserRM>> getAllUsers() async {
    try {
      final url = urlBuilder.buildGetAllUsersUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final users = (jsonObject[_usersJsonKey] as List)
          .map((user) => UserRM.fromJson(user))
          .toList();

      return users;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TaskRM>> getAllTasks() async {
    try {
      final url = urlBuilder.buildGetAllTasksUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final tasks = (jsonObject[_tasksJsonKey] as List)
          .map((task) => TaskRM.fromJson(task))
          .toList();

      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ContactRM>> getAllContacts() async {
    try {
      final url = urlBuilder.buildGetAllContactsUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final contacts = (jsonObject[_contactsJsonKey] as List)
          .map((task) => ContactRM.fromJson(task))
          .toList();

      return contacts;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DealRM>> getAllDeals() async {
    try {
      final url = urlBuilder.buildGetAllDealsUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final deals = (jsonObject[_dealsJsonKey] as List)
          .map((deal) => DealRM.fromJson(deal))
          .toList();

      return deals;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CompanyRM>> getAllCompanies() async {
    try {
      final url = urlBuilder.buildGetAllCompaniesUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final companies = (jsonObject[_companiesJsonKey] as List)
          .map((company) => CompanyRM.fromJson(company))
          .toList();

      return companies;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CustomFieldRM>> getContactCustomFields() async {
    try {
      final url = urlBuilder.buildGetContactCustomFieldsUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final customFields = (jsonObject[_customFieldsJsonKey] as List)
          .map((customField) => CustomFieldRM.fromJson(customField))
          .toList();

      return customFields;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CustomFieldRM>> getDealCustomFields() async {
    try {
      final url = urlBuilder.buildGetDealCustomFieldsUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final customFields = (jsonObject[_customFieldsJsonKey] as List)
          .map((customField) => CustomFieldRM.fromJson(customField))
          .toList();

      return customFields;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CustomFieldRM>> getCompanyCustomFields() async {
    try {
      final url = urlBuilder.buildGetCompanyCustomFieldsUrl();

      final response = await _dio.get(url);

      final jsonObject = response.data;
      final customFields = (jsonObject[_customFieldsJsonKey] as List)
          .map((customField) => CustomFieldRM.fromJson(customField))
          .toList();

      return customFields;
    } catch (e) {
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
    required ValueNotifier isUserExpiredVN,
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
          final isUserExpired = response.data is String &&
              response.data.contains('Expired Membership');
          if (isUserExpired) {
            isUserExpiredVN.value = true;
          }
        },
      ),
    );
  }
}
