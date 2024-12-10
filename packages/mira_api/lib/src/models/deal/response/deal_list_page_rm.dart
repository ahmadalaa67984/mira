import 'package:mira_api/src/models/deal/response/response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'deal_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class DealListPageRM {
  DealListPageRM({
    required this.deals,
    required this.totalPages,
  });

  @JsonKey(name: 'deals')
  final List<DealRM> deals;
  @JsonKey(name: 'max_pages')
  final int totalPages;



  static const fromJson = _$DealListPageRMFromJson;
}
