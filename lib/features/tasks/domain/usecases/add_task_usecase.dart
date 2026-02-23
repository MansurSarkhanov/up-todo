import 'package:either_dart/either.dart';

import '../repositories/task_repository.dart';

class AddTaskUsecase {
  final ITaskRepository repository;

  AddTaskUsecase(this.repository);

  Future<Either<bool, String>> call({
    required String title,
    required String userId,
    String? description,
    required DateTime dueDate,
    required int priority,
    required String categoryName,
    required String categoryIcon,
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
