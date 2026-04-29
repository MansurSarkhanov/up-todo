import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/data/models/task_model.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

class WatchTaskUsecase {
  WatchTaskUsecase(this.repository);
  final ITaskRepository repository;

  Either<Stream<Task>, String> call({required String taskId}) {
    final result = repository.watchTask(taskId);
    return result;
  }
}
