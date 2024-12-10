import 'package:json_annotation/json_annotation.dart';

part 'create_task_rm.g.dart';

@JsonSerializable(createFactory: false)
class CreateOrUpdateTaskRM {
  const CreateOrUpdateTaskRM({
    this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    this.priority,
    required this.collaborators,
    required this.type,
    required this.description,
    this.companyName,
    this.dealName,
    this.contactId,
    this.assigneeId,
  });

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;

  @JsonKey(name: 'start-date', includeIfNull: false)
  final String startDate;

  @JsonKey(name: 'end-date', includeIfNull: false)
  final String endDate;

  @JsonKey(name: 'priority', includeIfNull: false)
  final String? priority;

  @JsonKey(name: 'task-callobrators', includeIfNull: false)
  final List<int> collaborators;

  @JsonKey(name: 'typeName', includeIfNull: false)
  final String type;

  @JsonKey(name: 'task-description', includeIfNull: false)
  final String description;

  @JsonKey(name: 'companyName', includeIfNull: false)
  final String? companyName;

  @JsonKey(name: 'dealName', includeIfNull: false)
  final String? dealName;

  @JsonKey(name: 'contactId', includeIfNull: false)
  final String? contactId;

  @JsonKey(name: 'assignToId', includeIfNull: false)
  final String? assigneeId;

  Map<String, dynamic> toJson() => _$CreateOrUpdateTaskRMToJson(this);
}
