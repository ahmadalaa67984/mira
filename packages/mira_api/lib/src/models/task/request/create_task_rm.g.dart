// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOrUpdateTaskRMToJson(
    CreateOrUpdateTaskRM instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['start-date'] = instance.startDate;
  val['end-date'] = instance.endDate;
  writeNotNull('priority', instance.priority);
  val['task-callobrators'] = instance.collaborators;
  val['typeName'] = instance.type;
  val['task-description'] = instance.description;
  writeNotNull('companyName', instance.companyName);
  writeNotNull('dealName', instance.dealName);
  writeNotNull('contactId', instance.contactId);
  writeNotNull('assignToId', instance.assigneeId);
  return val;
}
