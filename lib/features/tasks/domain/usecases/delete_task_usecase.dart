import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

class DeleteTaskUsecase {
  DeleteTaskUsecase(this.repository);
  final ITaskRepository repository;

  Future<Either<bool, String>> call({
    required String taskId,
    required String userId,
  }) async {
    final result = await repository.deleteTask(taskId: taskId, userId: userId);
    return result;
  }
}
