import 'package:mira_api/src/models/company/response/response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class CompanyListPageRM {
  CompanyListPageRM({
    required this.companies,
    required this.totalPages,
  });

  @JsonKey(name: 'companies')
  final List<CompanyRM> companies;
  @JsonKey(name: 'max_pages')
  final int totalPages;



  static const fromJson = _$CompanyListPageRMFromJson;
}
