import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

class AddTaskUsecase {
  AddTaskUsecase(this.repository);
  final ITaskRepository repository;

  Future<Either<bool, String>> call({
    required String title,
    required String userId,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
    String? description,
  }) async {
    final result = await repository.addTask(
      title: title,
      userId: userId,
      description: description,
      dueDate: dueDate,
      priority: priority,
      categoryName: categoryName,
      categoryIcon: categoryIcon,
    );
    return result;
  }
}
