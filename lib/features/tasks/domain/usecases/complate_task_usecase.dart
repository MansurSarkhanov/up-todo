import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

class ComplateTaskUsecase {
  ComplateTaskUsecase(this.repository);
  final ITaskRepository repository;

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
