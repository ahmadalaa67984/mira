import 'package:json_annotation/json_annotation.dart';

part 'create_deal_rm.g.dart';

@JsonSerializable(createFactory: false)
class CreateOrUpdateDealRM {
  const CreateOrUpdateDealRM({
    this.id,
    required this.name,
    required this.ownerId,
    this.followers,
    this.value,
    this.startDate,
    this.endDate,
    this.stageId,
    required this.companyId,
    required this.contactId,
    this.cr,
    this.vat,
  });

  @JsonKey(name: 'deal_id')
  final String? id;
  @JsonKey(name: 'deal_name')
  final String name;
  @JsonKey(name: 'deal_owner')
  final int ownerId;
  @JsonKey(name: 'followers', includeIfNull: false)
  final List<int>? followers;
  @JsonKey(name: 'value', includeIfNull: false)
  final double? value;
  @JsonKey(name: 'deal_start_date', includeIfNull: false)
  final String? startDate;
  @JsonKey(name: 'deal_end_date', includeIfNull: false)
  final String? endDate;
  @JsonKey(name: 'stage', includeIfNull: false)
  final int? stageId;
  @JsonKey(name: 'company')
  final int companyId;
  @JsonKey(name: 'contact')
  final int contactId;
  @JsonKey(name: 'cr', includeIfNull: false)
  final double? cr;
  @JsonKey(name: 'vat', includeIfNull: false)
  final int? vat;

  Map<String, dynamic> toJson() => _$CreateOrUpdateDealRMToJson(this);
}
