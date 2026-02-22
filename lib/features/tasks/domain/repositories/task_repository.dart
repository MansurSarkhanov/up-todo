import 'package:either_dart/either.dart';

import '../../data/models/task_model.dart';

abstract class ITaskRepository {
  Future<Either<bool, String>> addTask({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
  });
  Either<Stream<List<Task>>, String> getTasks(String userId);
}
