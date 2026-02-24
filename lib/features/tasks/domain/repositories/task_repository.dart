import 'package:either_dart/either.dart';

import '../../data/models/task_model.dart';

abstract class ITaskRepository {
  Future<Either<bool, String>> addTask({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
  });
  Either<Stream<List<Task>>, String> getTasks(String userId);
  Either<Stream<Task>, String> watchTask(String taskId);
  Future<Either<bool, String>> editTask({
    required String taskId,
    String? title,
    String? description,
    DateTime? dueDate,
    int? priority,
    String? categoryName,
    String? categoryIcon,
  });
}
