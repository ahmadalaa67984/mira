// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRM _$TaskRMFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TaskRM',
      json,
      ($checkedConvert) {
        final val = TaskRM(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          ownerId: $checkedConvert('owner_id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String),
          assigneeId: $checkedConvert('assignee', (v) => v as String?),
          assigneeName: $checkedConvert('assigneeName', (v) => v as String?),
          collaboratorsNames: $checkedConvert(
              'task-calibrators-names',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          collaboratorsIds: $checkedConvert(
              'task-calibrators-ids', (v) => v as List<dynamic>? ?? const []),
          startDate: $checkedConvert('start-date', (v) => v as String?),
          dueDate: $checkedConvert('end-date', (v) => v as String?),
          priority: $checkedConvert('priority', (v) => v as String?),
          type: $checkedConvert('log-type', (v) => v as String?),
          description: $checkedConvert('task-description', (v) => v as String?),
          activities: $checkedConvert(
              'activities',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => ActivityRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          associatedDeals: $checkedConvert(
              'deals',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AssociatedModuleRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          associatedCompanies: $checkedConvert(
              'companies',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AssociatedModuleRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          history: $checkedConvert(
              'historyData',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => HistoryRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          contactId: $checkedConvert('contact', (v) => v as String?),
          contactName: $checkedConvert('contactName', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'ownerId': 'owner_id',
        'assigneeId': 'assignee',
        'collaboratorsNames': 'task-calibrators-names',
        'collaboratorsIds': 'task-calibrators-ids',
        'startDate': 'start-date',
        'dueDate': 'end-date',
        'type': 'log-type',
        'description': 'task-description',
        'associatedDeals': 'deals',
        'associatedCompanies': 'companies',
        'history': 'historyData',
        'contactId': 'contact'
      },
    );
