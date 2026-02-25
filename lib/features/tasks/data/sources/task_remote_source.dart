import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_todo/core/models/api_result.dart';

import '../../../../core/log/app_logger.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/services/firestore_service.dart';
import '../models/task_model.dart';

abstract class ITaskRemoteSource {
  Future<ApiResult<bool>> addTask({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
  });

  ApiResult<Stream<List<Task>>> getTasks({
    required String userId,
    bool? isCompleted,
  });
  ApiResult<Stream<Task>> watchTask(String taskId);
  Future<ApiResult<bool>> editTask({
    required String taskId,
    String? title,
    String? description,
    DateTime? dueDate,
    int? priority,
    String? categoryName,
    String? categoryIcon,
  });
  Future<ApiResult<bool>> deleteTask({
    required String taskId,
    required String userId,
  });
  Future<ApiResult<bool>> complatedTask({
    required String taskId,
    required bool isDone,
  });
}

class TaskRemoteSource implements ITaskRemoteSource {
  final FirestoreService firestoreService;

  TaskRemoteSource({required this.firestoreService});

  @override
  Future<ApiResult<bool>> addTask({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
  }) async {
    try {
      AppLogger.i(
        'Attempt add task with title: $title, userId: $userId, description: $description, dueDate: $dueDate, priority: $priority',
      );
      final result = await firestoreService.addTodo(
        title: title,
        userId: userId,
        description: description,
        dueDate: dueDate,
        priority: priority,
        categoryName: categoryName,
        categoryIcon: categoryIcon,
      );
      AppLogger.i('Task added successfully with result: $result');
      return ApiResult.success(data: true);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed to add task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  ApiResult<Stream<List<Task>>> getTasks({
    required String userId,
    bool? isCompleted,
  }) {
    try {
      AppLogger.i('Attempt get tasks for userId: $userId');
      final result = firestoreService.getTasksStream(
        userId: userId,
        isCompleted: isCompleted,
      );
      AppLogger.i('Task get successfully with result: $result');
      return ApiResult.success(data: result);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed to add task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  ApiResult<Stream<Task>> watchTask(String taskId) {
    try {
      AppLogger.i('Attempt get task for taskId: $taskId');
      final result = firestoreService.watchTask(taskId);
      AppLogger.i('Task watch successfully with result: $result');
      return ApiResult.success(data: result);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed watch task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> editTask({
    required String taskId,
    String? title,
    String? description,
    DateTime? dueDate,
    int? priority,
    String? categoryName,
    String? categoryIcon,
  }) async {
    try {
      AppLogger.i('Attempt update task for taskId: $taskId');
      await firestoreService.editTask(
        taskId: taskId,
        title: title,
        description: description,
        dueDate: dueDate,
        priority: priority,
        categoryName: categoryName,
        categoryIcon: categoryIcon,
      );
      AppLogger.i('Task update successfully ');
      return ApiResult.success(data: true);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed update task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> deleteTask({
    required String taskId,
    required String userId,
  }) async {
    try {
      AppLogger.i('Attempt delete task for taskId: $taskId');
      await firestoreService.deleteTodo(docId: taskId, userId: userId);
      AppLogger.i('Task delete successfully ');
      return ApiResult.success(data: true);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed delete task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> complatedTask({
    required String taskId,
    required bool isDone,
  }) async {
    try {
      AppLogger.i('Attempt complate task for taskId: $taskId');
      await firestoreService.updateTodo(docId: taskId, isCompleted: isDone);
      AppLogger.i('Task complate successfully ');
      return ApiResult.success(data: true);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed complate task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }
}
