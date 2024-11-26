// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealRM _$DealRMFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DealRM',
      json,
      ($checkedConvert) {
        final val = DealRM(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          value: $checkedConvert('value', (v) => v as String?),
          startDate: $checkedConvert('deal-start-date', (v) => v as String?),
          endDate: $checkedConvert('deal-end-date', (v) => v as String?),
          ownerName: $checkedConvert('owner', (v) => v as String?),
          followers: $checkedConvert(
              'follower',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => UserRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          lifeCycle: $checkedConvert('cycle', (v) => v as String?),
          stageName: $checkedConvert('stage', (v) => v as String?),
          companyName: $checkedConvert('company', (v) => v as String?),
          contactName: $checkedConvert('contact', (v) => v as String?),
          postStatus: $checkedConvert('post_status', (v) => v as String?),
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
        );
        return val;
      },
      fieldKeyMap: const {
        'startDate': 'deal-start-date',
        'endDate': 'deal-end-date',
        'ownerName': 'owner',
        'followers': 'follower',
        'lifeCycle': 'cycle',
        'stageName': 'stage',
        'companyName': 'company',
        'contactName': 'contact',
        'postStatus': 'post_status',
        'associatedContacts': 'contacts'
      },
    );
