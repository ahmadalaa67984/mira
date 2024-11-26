// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRM _$CompanyRMFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CompanyRM',
      json,
      ($checkedConvert) {
        final val = CompanyRM(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          phone: $checkedConvert('phone', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          website: $checkedConvert('website', (v) => v as String?),
          owner: $checkedConvert('owner', (v) => v as String?),
          ownerName: $checkedConvert('owner_name', (v) => v as String?),
          followers: $checkedConvert(
              'followers',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => UserRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          brief: $checkedConvert('brief', (v) => v as String?),
          lifeCycle: $checkedConvert('cycle', (v) => v as String?),
          lifeCycleFromGetSingleCompany:
              $checkedConvert('life_cycle', (v) => v as String?),
          priority: $checkedConvert('priority', (v) => v as String?),
          facebook: $checkedConvert('facebook', (v) => v as String?),
          twitter: $checkedConvert('twitter', (v) => v as String?),
          instagram: $checkedConvert('instagram', (v) => v as String?),
          tiktok: $checkedConvert('tiktok', (v) => v as String?),
          snapchat: $checkedConvert('snapchat', (v) => v as String?),
          linkedin: $checkedConvert('linkedin', (v) => v as String?),
          mkFields: $checkedConvert(
              'mk_fields',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => MkFieldRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          associatedContacts: $checkedConvert(
              'contacts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => ContactRM.fromJson(e as Map<String, dynamic>))
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
        );
        return val;
      },
      fieldKeyMap: const {
        'ownerName': 'owner_name',
        'lifeCycle': 'cycle',
        'lifeCycleFromGetSingleCompany': 'life_cycle',
        'mkFields': 'mk_fields',
        'associatedContacts': 'contacts',
        'associatedDeals': 'deals'
      },
    );
