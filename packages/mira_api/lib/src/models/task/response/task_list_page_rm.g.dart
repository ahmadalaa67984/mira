// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskListPageRM _$TaskListPageRMFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TaskListPageRM',
      json,
      ($checkedConvert) {
        final val = TaskListPageRM(
          tasks: $checkedConvert(
              'tasks',
              (v) => (v as List<dynamic>)
                  .map((e) => TaskRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalPages: $checkedConvert('max_pages', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'totalPages': 'max_pages'},
    );
