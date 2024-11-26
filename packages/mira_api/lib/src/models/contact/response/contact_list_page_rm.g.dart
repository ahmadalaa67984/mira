// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_list_page_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactListPageRM _$ContactListPageRMFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ContactListPageRM',
      json,
      ($checkedConvert) {
        final val = ContactListPageRM(
          contacts: $checkedConvert(
              'contacts',
              (v) => (v as List<dynamic>)
                  .map((e) => ContactRM.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalPages: $checkedConvert('max_pages', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'totalPages': 'max_pages'},
    );
