// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_cycles_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeCyclesRM _$LifeCyclesRMFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LifeCyclesRM',
      json,
      ($checkedConvert) {
        final val = LifeCyclesRM(
          contact: $checkedConvert('contactLifeCycle',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          company: $checkedConvert('companyLifeCycle',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          deal: $checkedConvert('dealLifeCycle',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'contact': 'contactLifeCycle',
        'company': 'companyLifeCycle',
        'deal': 'dealLifeCycle'
      },
    );
