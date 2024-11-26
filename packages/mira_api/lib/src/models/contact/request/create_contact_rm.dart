import 'package:json_annotation/json_annotation.dart';

part 'create_contact_rm.g.dart';

@JsonSerializable(createFactory: false)
class CreateOrUpdateContactRM {
  const CreateOrUpdateContactRM({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    this.company,
    this.jobTitle,
    this.lifeCycle,
    this.priority,
    this.owner,
    this.followers,
    this.status,
    this.note,
    this.dealName,
  });

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'company', includeIfNull: false)
  final String? company;
  @JsonKey(name: 'job_title', includeIfNull: false)
  final String? jobTitle;
  @JsonKey(name: 'life-cycle', includeIfNull: false)
  final String? lifeCycle;
  @JsonKey(name: 'priority', includeIfNull: false)
  final String? priority;
  @JsonKey(name: 'owner', includeIfNull: false)
  final String? owner;
  @JsonKey(name: 'follower', includeIfNull: false)
  final List<int>? followers;
  @JsonKey(name: 'note', includeIfNull: false)
  final String? note;
  @JsonKey(name: 'status', includeIfNull: false)
  final String? status;
  @JsonKey(name: 'dealName', includeIfNull: false)
  final String? dealName;

  Map<String, dynamic> toJson() => _$CreateOrUpdateContactRMToJson(this);
}
