import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/data/models/task_model.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

class GetTasksUsecase {
  GetTasksUsecase(this.repository);
  final ITaskRepository repository;

  Either<Stream<List<Task>>, String> call({
    required String userId,
    bool? isCompleted,
  }) {
    final result = repository.getTasks(
      userId: userId,
      isCompleted: isCompleted,
    );
    return result;
  }
}
