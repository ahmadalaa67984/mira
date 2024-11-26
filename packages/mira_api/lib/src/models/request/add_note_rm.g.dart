// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddNoteRMToJson(AddNoteRM instance) {
  final val = <String, dynamic>{
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('contactId', instance.contactId);
  writeNotNull('companyId', instance.companyName);
  writeNotNull('deal', instance.dealName);
  writeNotNull('task_id', instance.taskId);
  return val;
}
