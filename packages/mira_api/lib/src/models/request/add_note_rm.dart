import 'package:json_annotation/json_annotation.dart';

part 'add_note_rm.g.dart';


@JsonSerializable(createFactory: false)
class AddNoteRM {
  const AddNoteRM({
    required this.description,
    this.contactId,
    this.companyName,
    this.dealName,
    this.taskId,
  });


  @JsonKey(name: 'description', includeIfNull: false)
  final String description;
  @JsonKey(name: 'contactId', includeIfNull: false)
  final String? contactId;
  @JsonKey(name: 'companyId', includeIfNull: false)
  final String? companyName;
  @JsonKey(name: 'deal', includeIfNull: false)
  final String? dealName;
  @JsonKey(name: 'task_id', includeIfNull: false)
  final String? taskId;

  Map<String, dynamic> toJson() => _$AddNoteRMToJson(this);
}
