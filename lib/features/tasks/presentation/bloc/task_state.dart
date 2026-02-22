import '../../data/models/task_model.dart';

enum TaskStatus { initial, loading, success, failure }

class TaskState {
  final TaskStatus status;
  final List<Task> tasks;
  final String? error;

  const TaskState({
    this.status = TaskStatus.initial,
    this.tasks = const [],
    this.error,
  });

  TaskState copyWith({TaskStatus? status, List<Task>? tasks, String? error}) {
    return TaskState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      error: error,
    );
  }
}
