// task_bloc.dart

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:up_todo/features/tasks/domain/usecases/watch_task_usecase.dart';

import '../../data/models/task_model.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/edit_task_usecase.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUsecase addTaskUsecase;
  final GetTasksUsecase getTasksUsecase;
  final WatchTaskUsecase watchTaskUsecase;
  final EditTaskUsecase editTaskUsecase;

  TaskBloc({
    required this.addTaskUsecase,
    required this.getTasksUsecase,
    required this.watchTaskUsecase,
    required this.editTaskUsecase,
  }) : super(const TaskState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTaskRequested>(_onAddTask);
    on<WatchTaskRequested>(_onWatchTask);
    on<EditTaskRequested>(_onEditTask);
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

  Future<void> _onWatchTask(
    WatchTaskRequested event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.loading));

    final response = watchTaskUsecase(taskId: event.taskId);

    return response.fold(
      (stream) async {
        await emit.forEach<Task>(
          stream,
          onData: (task) => state.copyWith(
            status: TaskStatus.success,
            watchedTask: task,
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

  Future<void> _onEditTask(
    EditTaskRequested event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(status: TaskStatus.loading));

    final result = await editTaskUsecase(
      taskId: event.taskId,
      title: event.title,
      description: event.description,
      dueDate: event.dueDate,
      priority: event.priority,
      categoryName: event.categoryName,
      categoryIcon: event.categoryIcon,
    );

    result.fold(
      (_) {
        add(LoadTasks(event.userId));
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
      categoryName: event.categoryName,
      categoryIcon: event.categoryIcon,
    );

    result.fold(
      (_) => add(LoadTasks(event.userId)),
      (error) => emit(state.copyWith(status: TaskStatus.failure)),
    );
  }
}
