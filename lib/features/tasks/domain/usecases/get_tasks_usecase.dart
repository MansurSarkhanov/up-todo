import 'package:either_dart/either.dart';

import '../../data/models/task_model.dart';
import '../repositories/task_repository.dart';

class GetTasksUsecase {
  final ITaskRepository repository;

  GetTasksUsecase(this.repository);

  Either<Stream<List<Task>>, String> call({required String userId}) {
    final result = repository.getTasks(userId);
    return result;
  }
}
