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
  });

  ApiResult<Stream<List<Task>>> getTasks(String userId);
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
  ApiResult<Stream<List<Task>>> getTasks(String userId) {
    try {
      AppLogger.i('Attempt get tasks for userId: $userId');
      final result = firestoreService.getTasksStream(userId);
      AppLogger.i('Task added successfully with result: $result');
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
}
