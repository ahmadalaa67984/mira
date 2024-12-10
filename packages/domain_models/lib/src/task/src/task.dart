import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class Task extends Equatable {
  const Task({
    required this.id,
    this.ownerId,
    this.name,
    this.assigneeId,
    this.assigneeName,
    this.type,
    this.startDate,
    this.dueDate,
    this.priority,
    this.isSelected = false,
    this.collaborators,
    this.description,
  });

  final int id;
  final String? name;
  final int? ownerId;
  final int? assigneeId;
  final String? assigneeName;
  final TaskType? type;
  final DateTime? startDate;
  final DateTime? dueDate;
  final String? priority;
  final bool isSelected;
  final List<User>? collaborators;
  final String? description;


  @override
  List<Object?> get props => [
        id,
        name,
        assigneeId,
        assigneeName,
        type,
        dueDate,
        priority,
        isSelected,
        collaborators,
        description,
      ];

  Task copyWithIsSelected(bool isSelected) {
    return Task(
      name: name,
      id: id,
      ownerId: ownerId,
      assigneeId: assigneeId,
      assigneeName: assigneeName,
      type: type,
      startDate: startDate,
      dueDate: dueDate,
      priority: priority,
      isSelected: isSelected,
      collaborators: collaborators,
      description: description,
    );
  }
}

// List<Task> dummyTasks = List.generate(
//   10,
//   (index) => Task(
//     id: index,
//     ownerId: index,
//     name: 'Task #$index',
//     assigneeName: 'Assignee #$index',
//     startDate: DateTime.now().copyWith(
//       month: index > 7 ? index - 1 : index + 1,
//       day: index + 1,
//     ),
//     dueDate: DateTime.now().copyWith(
//       month: index > 10 ? index - 2 : index + 2,
//       day: index + 2,
//     ),
//     priority: dummyPriorities[index % dummyPriorities.length],
//     isSelected: false,
//     description: index % 2 == 0 ? loremIpsum(words: (index + 1) * 7) : null,
//     historyLog: const [],
//     associatedContacts: dummyAssociatedContacts,
//     associatedCompanies: dummyAssociatedCompanies,
//   ),
// );
//
// List<Task> dummyTaskDependencies = List.generate(
//   5,
//   (index) => Task(
//     id: index,
//     ownerId: index,
//     name: 'dTask #$index',
//     assigneeName: 'dAssignee #$index',
//     startDate: DateTime.now().copyWith(
//       month: index > 1 ? index - 1 : index + 1,
//       day: index + 1,
//     ),
//     dueDate: DateTime.now().copyWith(
//       month: index > 3 ? index - 2 : index + 2,
//       day: index + 2,
//     ),
//     priority: dummyPriorities[index % dummyPriorities.length],
//     isSelected: false,
//     description: index % 2 == 0 ? loremIpsum(words: (index + 5) * 2) : null,
//     historyLog: const [],
//   ),
// );
//
// List<String> dummyActivityLog =
//     List.generate(20, (index) => loremIpsum(words: 1));
//
// List<Task> dummyAssociatedTasks = List.generate(
//   5,
//   (index) => Task(
//     id: index,
//     ownerId: index,
//     name: 'Task #$index',
//     assigneeName: 'Assignee #$index',
//     startDate: DateTime.now().copyWith(
//       month: index > 7 ? index - 1 : index + 1,
//       day: index + 1,
//     ),
//     dueDate: DateTime.now().copyWith(
//       month: index > 10 ? index - 2 : index + 2,
//       day: index + 2,
//     ),
//     priority: dummyPriorities[index % dummyPriorities.length],
//     isSelected: false,
//     description: index % 2 == 0 ? loremIpsum(words: (index + 1) * 7) : null,
//     historyLog: const [],
//   ),
// );
