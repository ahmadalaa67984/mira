// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactRM _$ContactRMFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ContactRM',
      json,
      ($checkedConvert) {
        final val = ContactRM(
          id: $checkedConvert('id', (v) => v),
          name: $checkedConvert('name', (v) => v as String),
          lastName: $checkedConvert('last-name', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phone: $checkedConvert('phone-number', (v) => v as String?),
          jobTitle: $checkedConvert('job-title', (v) => v as String?),
          lifeCycle: $checkedConvert('lifecycle', (v) => v as String?),
          owner: $checkedConvert('owner', (v) => v as String?),
          ownerId: $checkedConvert('owner_id', (v) => v as String?),
          priority: $checkedConvert('priority', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String?),
          notes: $checkedConvert('notes', (v) => v as String?),
          associatedCompanies: $checkedConvert(
              'companies',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => AssociatedModuleRM.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          associatedDeals: $checkedConvert(
              'deals',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => AssociatedModuleRM.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          activities: $checkedConvert(
              'activities',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => ActivityRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          history: $checkedConvert(
              'history',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => HistoryRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          followers: $checkedConvert(
              'followers',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => UserRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          mkFields: $checkedConvert(
              'mk_fields',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => MkFieldRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
      fieldKeyMap: const {
        'lastName': 'last-name',
        'phone': 'phone-number',
        'jobTitle': 'job-title',
        'lifeCycle': 'lifecycle',
        'ownerId': 'owner_id',
        'associatedCompanies': 'companies',
        'associatedDeals': 'deals',
        'mkFields': 'mk_fields'
      },
    );
