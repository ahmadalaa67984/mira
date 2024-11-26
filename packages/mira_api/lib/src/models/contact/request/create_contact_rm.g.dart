// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contact_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOrUpdateContactRMToJson(
    CreateOrUpdateContactRM instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'last_name': instance.lastName,
    'email': instance.email,
    'phone': instance.phone,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('company', instance.company);
  writeNotNull('job_title', instance.jobTitle);
  writeNotNull('life-cycle', instance.lifeCycle);
  writeNotNull('priority', instance.priority);
  writeNotNull('owner', instance.owner);
  writeNotNull('follower', instance.followers);
  writeNotNull('note', instance.note);
  writeNotNull('status', instance.status);
  writeNotNull('dealName', instance.dealName);
  return val;
}
