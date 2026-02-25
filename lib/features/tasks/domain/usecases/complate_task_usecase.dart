import 'package:either_dart/either.dart';

import '../repositories/task_repository.dart';

class ComplateTaskUsecase {
  final ITaskRepository repository;

  ComplateTaskUsecase(this.repository);

  Future<Either<bool, String>> call({
    required String taskId,
    required bool isDone,
  }) async {
    final result = await repository.complatedTask(
      taskId: taskId,
      isDone: isDone,
    );
    return result;
  }
}
