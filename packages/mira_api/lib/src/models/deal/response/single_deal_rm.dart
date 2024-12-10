import 'package:mira_api/mira_api.dart';
import 'package:mira_api/src/models/response/src/mk_field_rm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_deal_rm.g.dart';

@JsonSerializable(createToJson: false)
class SingleDealRM {
  SingleDealRM({
    required this.id,
    required this.name,
    this.value,
    this.startDate,
    this.endDate,
    this.ownerId,
    this.ownerName,
    this.cr,
    this.vat,
    this.followers = const [],
    this.lifeCycle,
    this.stageId,
    this.stageName,
    this.companyId,
    this.companyName,
    this.associatedContacts = const [],
    this.activities = const [],
    this.history = const [],
    this.mkFields = const [],
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'deal-start-date')
  final String? startDate;
  @JsonKey(name: 'deal-end-date')
  final String? endDate;
  @JsonKey(name: 'cr')
  final String? cr;
  @JsonKey(name: 'vat')
  final String? vat;
  @JsonKey(name: 'owner')
  final String? ownerName;
  @JsonKey(name: 'owner_id')
  final String? ownerId;
  @JsonKey(name: 'follower')
  final List<UserRM> followers;
  @JsonKey(name: 'cycle')
  final String? lifeCycle;
  @JsonKey(name: 'stage')
  final String? stageId;
  @JsonKey(name: 'stage_name')
  final String? stageName;
  @JsonKey(name: 'company')
  final String? companyId;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'contacts')
  final List<ContactRM> associatedContacts;
  @JsonKey(name: 'activities')
  final List<ActivityRM> activities;
  @JsonKey(name: 'history')
  final List<HistoryRM> history;
  @JsonKey(name: 'mk_fields')
  final List<MkFieldRM> mkFields;

  static const fromJson = _$SingleDealRMFromJson;
}
