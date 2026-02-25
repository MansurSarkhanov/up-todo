import 'package:either_dart/either.dart';

import '../repositories/task_repository.dart';

class DeleteTaskUsecase {
  final ITaskRepository repository;

  DeleteTaskUsecase(this.repository);

  Future<Either<bool, String>> call({
    required String taskId,
    required String userId,
  }) async {
    final result = await repository.deleteTask(taskId: taskId, userId: userId);
    return result;
  }
}
