import 'package:mira_api/src/models/task/response/response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task_list_page_rm.g.dart';

@JsonSerializable(createToJson: false)
class TaskListPageRM {
  TaskListPageRM({
    required this.tasks,
    required this.totalPages,
  });

  @JsonKey(name: 'tasks')
  final List<TaskRM> tasks;
  @JsonKey(name: 'max_pages')
  final int totalPages;



  static const fromJson = _$TaskListPageRMFromJson;
}
