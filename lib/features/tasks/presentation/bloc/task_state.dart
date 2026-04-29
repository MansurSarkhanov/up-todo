import 'package:up_todo/features/tasks/data/models/task_model.dart';

enum TaskStatus { initial, loading, success, failure }

class TaskState {
  const TaskState({
    this.status = TaskStatus.initial,
    this.tasks = const [],
    this.error,
    this.watchedTask,
  });
  final TaskStatus status;
  final List<Task> tasks;
  final String? error;
  final Task? watchedTask;

  TaskState copyWith({
    TaskStatus? status,
    List<Task>? tasks,
    String? error,
    Task? watchedTask,
  }) {
    return TaskState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      error: error,
      watchedTask: watchedTask ?? this.watchedTask,
    );
  }
}
