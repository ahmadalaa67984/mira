// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomFieldRM _$CustomFieldRMFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CustomFieldRM',
      json,
      ($checkedConvert) {
        final val = CustomFieldRM(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          label: $checkedConvert('label', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          options: $checkedConvert('options',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          isRequired: $checkedConvert('required', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'isRequired': 'required'},
    );
