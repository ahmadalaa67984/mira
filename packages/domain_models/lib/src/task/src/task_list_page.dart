import 'package:domain_models/src/task/src/task.dart';
import 'package:equatable/equatable.dart';

class TaskListPage extends Equatable {
  const TaskListPage({
    required this.tasks,
    required this.totalPages,
  });

  final List<Task> tasks;
  final int totalPages;


  TaskListPage copyWith({
    List<Task>? tasks,
    int? totalPages,
  }) {
    return TaskListPage(
      tasks: tasks ?? this.tasks,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object?> get props =>
      [
        tasks,
        totalPages,
      ];
}
