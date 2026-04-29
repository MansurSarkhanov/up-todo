import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {
  const LoadTasks({required this.userId, this.isCompleted});
  final String userId;
  final bool? isCompleted;
}

class AddTaskRequested extends TaskEvent {
  const AddTaskRequested({
    required this.title,
    required this.userId,
    required this.dueDate,
    required this.priority,
    required this.categoryName,
    required this.categoryIcon,
    this.description,
  });
  final String title;
  final String userId;
  final String? description;
  final DateTime dueDate;
  final int priority;
  final String categoryName;
  final String categoryIcon;
  @override
  List<Object?> get props => [
    title,
    userId,
    description,
    dueDate,
    priority,
    categoryName,
    categoryIcon,
  ];
}

class DeleteTaskRequested extends TaskEvent {
  const DeleteTaskRequested({required this.taskId, required this.userId});
  final String taskId;
  final String userId;
}

class ComplateTaskRequested extends TaskEvent {
  const ComplateTaskRequested({
    required this.taskId,
    required this.isDone,
    required this.userId,
  });
  final String taskId;
  final bool isDone;
  final String userId;
}

class ToggleTaskRequested extends TaskEvent {}

class WatchTaskRequested extends TaskEvent {
  const WatchTaskRequested(this.taskId);
  final String taskId;
}

class EditTaskRequested extends TaskEvent {
  const EditTaskRequested({
    required this.taskId,
    required this.userId,
    this.title,
    this.description,
    this.dueDate,
    this.priority,
    this.categoryName,
    this.categoryIcon,
  });
  final String taskId;
  final String? title;
  final String? description;
  final DateTime? dueDate;
  final int? priority;
  final String? categoryName;
  final String? categoryIcon;
  final String userId;
}
