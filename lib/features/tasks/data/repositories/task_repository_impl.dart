import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/data/models/task_model.dart';
import 'package:up_todo/features/tasks/data/sources/task_remote_source.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements ITaskRepository {
  TaskRepositoryImpl({required this.remoteSource});
  final ITaskRemoteSource remoteSource;
  @override
  Future<Either<bool, String>> addTask({
    required String title,
    required String userId,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
    String? description,
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
      return const Left(true);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }

  @override
  Either<Stream<List<Task>>, String> getTasks({
    required String userId,
    bool? isCompleted,
  }) {
    final response = remoteSource.getTasks(
      userId: userId,
      isCompleted: isCompleted,
    );
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

  @override
  Future<Either<bool, String>> editTask({
    required String taskId,
    String? title,
    String? description,
    DateTime? dueDate,
    int? priority,
    String? categoryName,
    String? categoryIcon,
  }) async {
    final response = await remoteSource.editTask(
      taskId: taskId,
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
      categoryName: categoryName,
      categoryIcon: categoryIcon,
    );
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }

  @override
  Future<Either<bool, String>> deleteTask({
    required String taskId,
    required String userId,
  }) async {
    final response = await remoteSource.deleteTask(
      taskId: taskId,
      userId: userId,
    );
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }

  @override
  Future<Either<bool, String>> complatedTask({
    required String taskId,
    required bool isDone,
  }) async {
    final response = await remoteSource.complatedTask(
      taskId: taskId,
      isDone: isDone,
    );
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }
}
