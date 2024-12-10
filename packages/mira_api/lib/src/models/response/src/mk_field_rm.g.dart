// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mk_field_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MkFieldRM _$MkFieldRMFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MkFieldRM',
      json,
      ($checkedConvert) {
        final val = MkFieldRM(
          name: $checkedConvert('key', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String?),
          values: $checkedConvert(
              'values',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
        );
        return val;
      },
      fieldKeyMap: const {'name': 'key'},
    );
