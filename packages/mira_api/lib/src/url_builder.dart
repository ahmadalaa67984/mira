import 'dart:math';

import 'package:flutter/material.dart';

class UrlBuilder {
  UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://backendwithdoc-hmdqjo3j.b4a.run/api';

  final String _baseUrl;
  static const String _baseUrlSecondPart = 'auth';
  final ValueNotifier<String> userBaseUrlPathVN = ValueNotifier<String>('');

  String _addRandomVersion(String url) {
    final random = Random().nextInt(100000);
    if (url.contains('?')) {
      return '$url&v=$random';
    }
    return '$url?v=$random';
  }

  String buildSignInUrl() {
    return '$_baseUrl/$_baseUrlSecondPart/login';
    // return _addRandomVersion(completeUrl);
  }

  String buildSignUpUrl() {
    return '$_baseUrl/$_baseUrlSecondPart/register';
  }

  String buildUpdateUserUrl() {
    final completeUrl = '$_baseUrl/$_baseUrlSecondPart/updateUser';
    return _addRandomVersion(completeUrl);
  }

  String buildUpdateAccountUrl() {
    final completeUrl = '$_baseUrl/$_baseUrlSecondPart/update_user_setup';
    return _addRandomVersion(completeUrl);
  }

  String buildChangePasswordUrl() {
    final completeUrl = '$_baseUrl/$_baseUrlSecondPart/changePassword';
    return _addRandomVersion(completeUrl);
  }

  String buildAddCommentUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/addComment';
    return _addRandomVersion(completeUrl);
  }

  String buildAddActivityUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/addActivity';
    return _addRandomVersion(completeUrl);
  }

  String buildAddNoteUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/addNote';
    return _addRandomVersion(completeUrl);
  }

  // Task urls
  String buildGetTasksUrl({
    required int pageNumber,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    String? assignee,
    String? startDate,
    String? endDate,
  }) {
    final pageQuery = '?page=$pageNumber';

    final searchTextQuery = searchText != null ? '&s=$searchText' : '';
    final sortByQuery = sortBy != null ? '&sort=$sortBy' : '';
    final archivedQuery = archived != null ? '&archived=$archived' : '';
    final creatorIdQuery = creatorId != null ? '&owner=$creatorId' : '';
    final assigneeQuery = assignee != null ? '&assignee=$assignee' : '';
    final startDateQuery = startDate != null ? '&date_start=$startDate' : '';
    final endDateQuery = endDate != null ? '&date_end=$endDate' : '';

    final cgiParams = '$pageQuery'
        '$searchTextQuery'
        '$sortByQuery'
        '$archivedQuery'
        '$creatorIdQuery'
        '$assigneeQuery'
        '$startDateQuery'
        '$endDateQuery';
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getTasks$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildGetTaskUrl(int id) {
    final idQuery = '?id=$id';

    final cgiParams = idQuery;
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getSingleTask$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildCreateTaskUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/createTask';
    return _addRandomVersion(completeUrl);
  }

  String buildUpdateTaskUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/updateTask';
    return _addRandomVersion(completeUrl);
  }

  String buildMassDeleteTasksUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/bulkDeleteTasks';
    return _addRandomVersion(completeUrl);
  }

  // Contact urls
  String buildCreateContactUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/createContact';
    return _addRandomVersion(completeUrl);
  }

  String buildUpdateContactUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/updateContact';
    return _addRandomVersion(completeUrl);
  }

  String buildGetContactsUrl({
    required int pageNumber,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    String? assignee,
    String? jobTitle,
    String? lifeCycle,
    String? priority,
    String? activeInactiveStatus,
  }) {
    final pageQuery = '?page=$pageNumber';

    final searchTextQuery = searchText != null ? '&s=$searchText' : '';
    final sortByQuery = sortBy != null ? '&sort=$sortBy' : '';
    final archivedQuery = archived != null ? '&archived=$archived' : '';
    final creatorIdQuery = creatorId != null ? '&owner=$creatorId' : '';
    final assigneeQuery = assignee != null ? '&assignee=$assignee' : '';
    final jobTitleQuery = jobTitle != null ? '&job-title=$jobTitle' : '';
    final lifeCycleQuery = lifeCycle != null ? '&life-cycle=$lifeCycle' : '';
    final priorityQuery = priority != null ? '&priority=$priority' : '';
    final activeInactiveStatusQuery =
        activeInactiveStatus != null ? '&status=$activeInactiveStatus' : '';

    final cgiParams = '$pageQuery'
        '$searchTextQuery'
        '$sortByQuery'
        '$archivedQuery'
        '$creatorIdQuery'
        '$assigneeQuery'
        '$jobTitleQuery'
        '$lifeCycleQuery'
        '$priorityQuery'
        '$activeInactiveStatusQuery';
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getContacts$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildGetContactUrl(int id) {
    final idQuery = '?id=$id';

    final cgiParams = idQuery;

    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getSingleContact$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildMassDeleteContactsUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/bulkDeleteContacts';
    return _addRandomVersion(completeUrl);
  }

  // Contact urls
  String buildCreateDealUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/createDeal';
    return _addRandomVersion(completeUrl);
  }

  String buildUpdateDealUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/updateDeal';
    return _addRandomVersion(completeUrl);
  }

  String buildGetDealsUrl({
    required int pageNumber,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    int? dealStageId,
  }) {
    final pageQuery = '?page=$pageNumber';

    final searchTextQuery = searchText != null ? '&s=$searchText' : '';
    final sortByQuery = sortBy != null ? '&sort=$sortBy' : '';
    final archivedQuery = archived != null ? '&archived=$archived' : '';
    final creatorIdQuery = creatorId != null ? '&owner=$creatorId' : '';
    final dealStageIdQuery = dealStageId != null ? '&stage=$dealStageId' : '';

    final cgiParams = '$pageQuery'
        '$searchTextQuery'
        '$sortByQuery'
        '$archivedQuery'
        '$creatorIdQuery'
        '$dealStageIdQuery';
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getDeals$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildGetDealUrl(int id) {
    final idQuery = '?id=$id';

    final cgiParams = idQuery;

    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getSingleDeal$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildMassDeleteDealsUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/bulkDeleteDeals';
    return _addRandomVersion(completeUrl);
  }

  // Company urls
  String buildCreateCompanyUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/createCompany';
    return _addRandomVersion(completeUrl);
  }

  String buildUpdateCompanyUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/updateCompany';
    return _addRandomVersion(completeUrl);
  }

  String buildGetCompaniesUrl({
    required int pageNumber,
    String? searchText,
    String? sortBy,
    int? archived,
    int? creatorId,
    String? assignee,
    String? jobTitle,
    String? lifeCycle,
    String? priority,
  }) {
    final pageQuery = '?page=$pageNumber';

    final searchTextQuery = searchText != null ? '&s=$searchText' : '';
    final sortByQuery = sortBy != null ? '&sort=$sortBy' : '';
    final archivedQuery = archived != null ? '&archived=$archived' : '';
    final creatorIdQuery = creatorId != null ? '&owner=$creatorId' : '';
    final assigneeQuery = assignee != null ? '&assignee=$assignee' : '';
    final jobTitleQuery = jobTitle != null ? '&job-title=$jobTitle' : '';
    final lifeCycleQuery = lifeCycle != null ? '&life-cycle=$lifeCycle' : '';
    final priorityQuery = priority != null ? '&priority=$priority' : '';

    final cgiParams = '$pageQuery'
        '$searchTextQuery'
        '$sortByQuery'
        '$archivedQuery'
        '$creatorIdQuery'
        '$assigneeQuery'
        '$jobTitleQuery'
        '$lifeCycleQuery'
        '$priorityQuery';
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getCompanies$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildGetCompanyUrl(int id) {
    final idQuery = '?id=$id';

    final cgiParams = idQuery;

    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getSingleCompany$cgiParams';
    return _addRandomVersion(completeUrl);
  }

  String buildMassDeleteCompaniesUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/bulkDeleteCompanies';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllTasksUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllTasks';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllContactsUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllContacts';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllDealsUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllDeals';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllUsersUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllUsers';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllCompaniesUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllCompanies';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllJobTitlesUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllJobTitles';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllStagesUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllStage';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllPrioritiesUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllPriority';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllLifeCyclesUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllLifeCycle';
    return _addRandomVersion(completeUrl);
  }

  String buildGetAllStatusUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getAllStatus';
    return _addRandomVersion(completeUrl);
  }

  String buildGetContactCustomFieldsUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getContactCustomFields';
    return _addRandomVersion(completeUrl);
  }

  String buildGetDealCustomFieldsUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getDealCustomFields';
    return _addRandomVersion(completeUrl);
  }

  String buildGetCompanyCustomFieldsUrl() {
    final completeUrl = '$_baseUrl'
        '${userBaseUrlPathVN.value}'
        '$_baseUrlSecondPart/getCompanyCustomFields';
    return _addRandomVersion(completeUrl);
  }
}
