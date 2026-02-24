import 'package:either_dart/either.dart';

import '../../data/models/task_model.dart';
import '../repositories/task_repository.dart';

class WatchTaskUsecase {
  final ITaskRepository repository;

  WatchTaskUsecase(this.repository);

  Either<Stream<Task>, String> call({required String taskId}) {
    final result = repository.watchTask(taskId);
    return result;
  }
}
