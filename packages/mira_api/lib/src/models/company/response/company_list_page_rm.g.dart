// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyListPageRM _$CompanyListPageRMFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CompanyListPageRM',
      json,
      ($checkedConvert) {
        final val = CompanyListPageRM(
          companies: $checkedConvert(
              'companies',
              (v) => (v as List<dynamic>)
                  .map((e) => CompanyRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalPages: $checkedConvert('max_pages', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'totalPages': 'max_pages'},
    );
