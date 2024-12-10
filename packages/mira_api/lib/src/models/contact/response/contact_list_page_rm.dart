import 'package:mira_api/src/models/contact/response/response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contact_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class ContactListPageRM {
  ContactListPageRM({
    required this.contacts,
    required this.totalPages,
  });

  @JsonKey(name: 'contacts')
  final List<ContactRM> contacts;
  @JsonKey(name: 'max_pages')
  final int totalPages;



  static const fromJson = _$ContactListPageRMFromJson;
}
