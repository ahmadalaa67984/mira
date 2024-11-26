import 'package:mira_api/mira_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_rm.g.dart';

@JsonSerializable(createToJson: false)
class ActivityRM {
  ActivityRM({
    required this.id,
    this.taskDescription,
    this.logDescription,
    this.task,
    this.note,
    this.type,
    this.logType,
    this.comments = const [],
    this.author,
    this.name,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'task-description')
  final String? taskDescription;
  @JsonKey(name: 'log-descriprion')
  final String? logDescription;
  @JsonKey(name: 'task')
  final String? task;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'log-type')
  final String? logType;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'comments')
  final List<CommentRM> comments;
  @JsonKey(name: 'name')
  final String? name;

  static const fromJson = _$ActivityRMFromJson;
}
