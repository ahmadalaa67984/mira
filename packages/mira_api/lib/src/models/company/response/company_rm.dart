import 'package:mira_api/mira_api.dart';
import 'package:mira_api/src/models/response/src/mk_field_rm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_rm.g.dart';

@JsonSerializable(createToJson: false)
class CompanyRM {
  CompanyRM({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.website,
    this.owner,
    this.ownerName,
    this.followers = const [],
    this.brief,
    this.lifeCycle,
    this.lifeCycleFromGetSingleCompany,
    this.priority,
    this.facebook,
    this.twitter,
    this.instagram,
    this.tiktok,
    this.snapchat,
    this.linkedin,
    this.mkFields = const [],
    this.associatedContacts = const [],
    this.associatedDeals = const [],
    this.activities = const [],
    this.history = const [],
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'website')
  final String? website;
  @JsonKey(name: 'owner')
  final String? owner;
  @JsonKey(name: 'owner_name')
  final String? ownerName;
  @JsonKey(name: 'followers')
  final List<UserRM> followers;
  @JsonKey(name: 'brief')
  final String? brief;
  @JsonKey(name: 'cycle')
  final String? lifeCycle;
  @JsonKey(name: 'life_cycle')
  final String? lifeCycleFromGetSingleCompany;
  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'facebook')
  final String? facebook;
  @JsonKey(name: 'twitter')
  final String? twitter;
  @JsonKey(name: 'instagram')
  final String? instagram;
  @JsonKey(name: 'tiktok')
  final String? tiktok;
  @JsonKey(name: 'snapchat')
  final String? snapchat;
  @JsonKey(name: 'linkedin')
  final String? linkedin;
  @JsonKey(name: 'mk_fields')
  final List<MkFieldRM> mkFields;
  @JsonKey(name: 'contacts')
  final List<ContactRM> associatedContacts;
  @JsonKey(name: 'deals')
  final List<AssociatedModuleRM> associatedDeals;
  @JsonKey(name: 'activities')
  final List<ActivityRM> activities;
  @JsonKey(name: 'history')
  final List<HistoryRM> history;

  static const fromJson = _$CompanyRMFromJson;
}
