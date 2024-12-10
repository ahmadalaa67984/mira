import 'package:mira_api/mira_api.dart';
import 'package:mira_api/src/models/response/src/mk_field_rm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_rm.g.dart';

@JsonSerializable(createToJson: false)
class ContactRM {
  ContactRM({
    required this.id,
    required this.name,
    this.lastName,
    this.email,
    this.phone,
    this.jobTitle,
    this.lifeCycle,
    this.owner,
    this.ownerId,
    this.priority,
    this.status,
    this.notes,
    this.associatedCompanies = const [],
    this.associatedDeals = const [],
    this.activities = const [],
    this.history = const [],
    this.followers = const [],
    this.mkFields = const [],
  });

  @JsonKey(name: 'id')
  final dynamic id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'last-name')
  final String? lastName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone-number')
  final String? phone;
  @JsonKey(name: 'job-title')
  final String? jobTitle;
  @JsonKey(name: 'lifecycle')
  final String? lifeCycle;
  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'notes')
  final String? notes;
  @JsonKey(name: 'owner')
  final String? owner;
  @JsonKey(name: 'owner_id')
  final String? ownerId;
  @JsonKey(name: 'companies')
  final List<AssociatedModuleRM> associatedCompanies;
  @JsonKey(name: 'deals')
  final List<AssociatedModuleRM> associatedDeals;
  @JsonKey(name: 'activities')
  final List<ActivityRM> activities;
  @JsonKey(name: 'history')
  final List<HistoryRM> history;
  @JsonKey(name: 'followers')
  final List<UserRM> followers;
  @JsonKey(name: 'mk_fields')
  final List<MkFieldRM> mkFields;

  static const fromJson = _$ContactRMFromJson;
}
