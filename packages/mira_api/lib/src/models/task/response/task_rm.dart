import 'package:mira_api/src/models/response/response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_rm.g.dart';

@JsonSerializable(createToJson: false)
class TaskRM {
  TaskRM({
    required this.id,
    this.ownerId,
    required this.name,
    this.assigneeId,
    this.assigneeName,
    this.collaboratorsNames = const [],
    this.collaboratorsIds = const [],
    this.startDate,
    this.dueDate,
    this.priority,
    this.type,
    this.description,
    this.activities,
    this.associatedDeals,
    this.associatedCompanies,
    this.history,
    this.contactId,
    this.contactName,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'owner_id')
  final String? ownerId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'assignee')
  final String? assigneeId;
  @JsonKey(name: 'assigneeName')
  final String? assigneeName;
  @JsonKey(name: 'task-calibrators-names')
  final List<String> collaboratorsNames;
  @JsonKey(name: 'task-calibrators-ids')
  final List<dynamic> collaboratorsIds;
  @JsonKey(name: 'start-date')
  final String? startDate;
  @JsonKey(name: 'end-date')
  final String? dueDate;
  @JsonKey(name: 'log-type')
  final String? type;
  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'task-description')
  final String? description;
  @JsonKey(name: 'activities')
  final List<ActivityRM>? activities;
  @JsonKey(name: 'deals')
  final List<AssociatedModuleRM>? associatedDeals;
  @JsonKey(name: 'companies')
  final List<AssociatedModuleRM>? associatedCompanies;
  @JsonKey(name: 'historyData')
  final List<HistoryRM>? history;
  @JsonKey(name: 'contact')
  final String? contactId;
  @JsonKey(name: 'contactName')
  final String? contactName;

  static const fromJson = _$TaskRMFromJson;
}
