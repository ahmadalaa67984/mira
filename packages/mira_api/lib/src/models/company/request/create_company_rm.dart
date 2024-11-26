import 'package:json_annotation/json_annotation.dart';

part 'create_company_rm.g.dart';

@JsonSerializable(createFactory: false)
class CreateOrUpdateCompanyRM {
  const CreateOrUpdateCompanyRM({
    this.id,
    required this.name,
    this.website,
    this.phone,
    required this.email,
    required this.ownerId,
    this.status,
    this.description,
    this.brief,
    this.priority,
    this.contactId,
    this.dealId,
    this.followers = const [],
    this.lifeCycle,
    this.facebook,
    this.instagram,
    this.linkedIn,
    this.twitter,
    this.snapchat,
    this.tiktok,
  });

  @JsonKey(name: 'post_id')
  final String? id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'website', includeIfNull: false)
  final String? website;
  @JsonKey(name: 'tel', includeIfNull: false)
  final String? phone;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'owner')
  final int ownerId;
  @JsonKey(name: 'status', includeIfNull: false)
  final String? status;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'brief', includeIfNull: false)
  final String? brief;
  @JsonKey(name: 'priority', includeIfNull: false)
  final String? priority;
  @JsonKey(name: 'contact', includeIfNull: false)
  final String? contactId;
  @JsonKey(name: 'deal_id', includeIfNull: false)
  final String? dealId;
  @JsonKey(name: 'followers', includeIfNull: false)
  final List<int>? followers;
  @JsonKey(name: 'life_cycle', includeIfNull: false)
  final String? lifeCycle;
  @JsonKey(name: 'facebook', includeIfNull: false)
  final String? facebook;
  @JsonKey(name: 'instagram', includeIfNull: false)
  final String? instagram;
  @JsonKey(name: 'linkedIn', includeIfNull: false)
  final String? linkedIn;
  @JsonKey(name: 'twitter', includeIfNull: false)
  final String? twitter;
  @JsonKey(name: 'snapchat', includeIfNull: false)
  final String? snapchat;
  @JsonKey(name: 'tiktok', includeIfNull: false)
  final String? tiktok;

  Map<String, dynamic> toJson() => _$CreateOrUpdateCompanyRMToJson(this);
}
