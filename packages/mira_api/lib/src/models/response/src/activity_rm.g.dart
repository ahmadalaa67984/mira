// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRM _$ActivityRMFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ActivityRM',
      json,
      ($checkedConvert) {
        final val = ActivityRM(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          taskDescription:
              $checkedConvert('task-description', (v) => v as String?),
          logDescription:
              $checkedConvert('log-descriprion', (v) => v as String?),
          task: $checkedConvert('task', (v) => v as String?),
          note: $checkedConvert('note', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          logType: $checkedConvert('log-type', (v) => v as String?),
          comments: $checkedConvert(
              'comments',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => CommentRM.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          author: $checkedConvert('author', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'taskDescription': 'task-description',
        'logDescription': 'log-descriprion',
        'logType': 'log-type'
      },
    );
