// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_company_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOrUpdateCompanyRMToJson(
    CreateOrUpdateCompanyRM instance) {
  final val = <String, dynamic>{
    'post_id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('website', instance.website);
  writeNotNull('tel', instance.phone);
  val['email'] = instance.email;
  val['owner'] = instance.ownerId;
  writeNotNull('status', instance.status);
  writeNotNull('description', instance.description);
  writeNotNull('brief', instance.brief);
  writeNotNull('priority', instance.priority);
  writeNotNull('contact', instance.contactId);
  writeNotNull('deal_id', instance.dealId);
  writeNotNull('followers', instance.followers);
  writeNotNull('life_cycle', instance.lifeCycle);
  writeNotNull('facebook', instance.facebook);
  writeNotNull('instagram', instance.instagram);
  writeNotNull('linkedIn', instance.linkedIn);
  writeNotNull('twitter', instance.twitter);
  writeNotNull('snapchat', instance.snapchat);
  writeNotNull('tiktok', instance.tiktok);
  return val;
}
