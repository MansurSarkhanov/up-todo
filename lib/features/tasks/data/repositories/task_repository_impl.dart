import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/data/models/task_model.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

import '../sources/task_remote_source.dart';

class TaskRepositoryImpl implements ITaskRepository {
  final ITaskRemoteSource remoteSource;

  TaskRepositoryImpl({required this.remoteSource});
  @override
  Future<Either<bool, String>> addTask({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
  }) async {
    final response = await remoteSource.addTask(
      title: title,
      userId: userId,
      description: description,
      dueDate: dueDate,
      priority: priority,
      categoryName: categoryName,
      categoryIcon: categoryIcon,
    );
    if (response.isSuccess) {
      return Left(true);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }

  @override
  Either<Stream<List<Task>>, String> getTasks(String userId) {
    final response = remoteSource.getTasks(userId);
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }

  @override
  Either<Stream<Task>, String> watchTask(String taskId) {
    final response = remoteSource.watchTask(taskId);
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }
}
