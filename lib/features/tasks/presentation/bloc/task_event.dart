import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {
  final String userId;
  const LoadTasks(this.userId);
}

class AddTaskRequested extends TaskEvent {
  final String title;
  final String userId;
  final String? description;
  final DateTime dueDate;
  final int priority;

  const AddTaskRequested({
    required this.title,
    required this.userId,
    this.description,
    required this.dueDate,
    required this.priority,
  });
  @override
  List<Object?> get props => [title, userId, description, dueDate, priority];
}

class DeleteTaskRequested extends TaskEvent {}

class ToggleTaskRequested extends TaskEvent {}
