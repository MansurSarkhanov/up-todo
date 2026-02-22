// task_bloc.dart

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/tasks/domain/usecases/get_tasks_usecase.dart';

import '../../data/models/task_model.dart';
import '../../domain/usecases/add_task_usecase.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUsecase addTaskUsecase;
  final GetTasksUsecase getTasksUsecase;

  TaskBloc({required this.addTaskUsecase, required this.getTasksUsecase})
    : super(const TaskState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTaskRequested>(_onAddTask);
  }
  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading));

    final response = getTasksUsecase(userId: event.userId);

    return response.fold(
      (stream) async {
        await emit.forEach<List<Task>>(
          stream,
          onData: (tasks) => state.copyWith(
            status: TaskStatus.success,
            tasks: tasks,
            error: null,
          ),
          onError: (err, _) =>
              state.copyWith(status: TaskStatus.failure, error: err.toString()),
        );
      },
      (error) {
        emit(state.copyWith(status: TaskStatus.failure, error: error));
      },
    );
  }

  Future<void> _onAddTask(
    AddTaskRequested event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.loading));

    final result = await addTaskUsecase(
      title: event.title,
      userId: event.userId,
      description: event.description,
      dueDate: event.dueDate,
      priority: event.priority,
    );

    result.fold(
      (_) => add(LoadTasks(event.userId)),
      (error) => emit(state.copyWith(status: TaskStatus.failure)),
    );
  }
}
