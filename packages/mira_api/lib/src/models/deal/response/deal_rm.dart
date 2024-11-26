import 'package:mira_api/mira_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deal_rm.g.dart';

@JsonSerializable(createToJson: false)
class DealRM {
  DealRM({
    required this.id,
    required this.name,
    this.value,
    this.startDate,
    this.endDate,
    this.ownerName,
    this.followers = const [],
    this.lifeCycle,
    this.stageName,
    this.companyName,
    this.contactName,
    this.postStatus,
    this.associatedContacts = const [],
    this.activities = const [],
    this.history = const [],
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
  @JsonKey(name: 'follower')
  final List<UserRM> followers;
  @JsonKey(name: 'owner')
  final String? ownerName;
  @JsonKey(name: 'cycle')
  final String? lifeCycle;
  @JsonKey(name: 'stage')
  final String? stageName;
  @JsonKey(name: 'company')
  final String? companyName;
  @JsonKey(name: 'contact')
  final String? contactName;
  @JsonKey(name: 'post_status')
  final String? postStatus;
  @JsonKey(name: 'contacts')
  final List<ContactRM> associatedContacts;
  @JsonKey(name: 'activities')
  final List<ActivityRM> activities;
  @JsonKey(name: 'history')
  final List<HistoryRM> history;

  static const fromJson = _$DealRMFromJson;
}
