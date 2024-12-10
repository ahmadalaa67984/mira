// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_deal_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleDealRM _$SingleDealRMFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SingleDealRM',
      json,
      ($checkedConvert) {
        final val = SingleDealRM(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          value: $checkedConvert('value', (v) => v as String?),
          startDate: $checkedConvert('deal-start-date', (v) => v as String?),
          endDate: $checkedConvert('deal-end-date', (v) => v as String?),
          ownerId: $checkedConvert('owner_id', (v) => v as String?),
          ownerName: $checkedConvert('owner', (v) => v as String?),
          cr: $checkedConvert('cr', (v) => v as String?),
          vat: $checkedConvert('vat', (v) => v as String?),
          followers: $checkedConvert(
              'follower',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => UserRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          lifeCycle: $checkedConvert('cycle', (v) => v as String?),
          stageId: $checkedConvert('stage', (v) => v as String?),
          stageName: $checkedConvert('stage_name', (v) => v as String?),
          companyId: $checkedConvert('company', (v) => v as String?),
          companyName: $checkedConvert('company_name', (v) => v as String?),
          associatedContacts: $checkedConvert(
              'contacts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => ContactRM.fromJson(e as Map<String, dynamic>))
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
        'startDate': 'deal-start-date',
        'endDate': 'deal-end-date',
        'ownerId': 'owner_id',
        'ownerName': 'owner',
        'followers': 'follower',
        'lifeCycle': 'cycle',
        'stageId': 'stage',
        'stageName': 'stage_name',
        'companyId': 'company',
        'companyName': 'company_name',
        'associatedContacts': 'contacts',
        'mkFields': 'mk_fields'
      },
    );
