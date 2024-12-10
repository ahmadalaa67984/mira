// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_deal_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOrUpdateDealRMToJson(
    CreateOrUpdateDealRM instance) {
  final val = <String, dynamic>{
    'deal_id': instance.id,
    'deal_name': instance.name,
    'deal_owner': instance.ownerId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('followers', instance.followers);
  writeNotNull('value', instance.value);
  writeNotNull('deal_start_date', instance.startDate);
  writeNotNull('deal_end_date', instance.endDate);
  writeNotNull('stage', instance.stageId);
  val['company'] = instance.companyId;
  val['contact'] = instance.contactId;
  writeNotNull('cr', instance.cr);
  writeNotNull('vat', instance.vat);
  return val;
}
