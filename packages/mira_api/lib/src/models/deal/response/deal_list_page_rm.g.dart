// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealListPageRM _$DealListPageRMFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DealListPageRM',
      json,
      ($checkedConvert) {
        final val = DealListPageRM(
          deals: $checkedConvert(
              'deals',
              (v) => (v as List<dynamic>)
                  .map((e) => DealRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalPages: $checkedConvert('max_pages', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'totalPages': 'max_pages'},
    );
