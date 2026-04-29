import 'package:either_dart/either.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';

class EditTaskUsecase {
  EditTaskUsecase(this.repository);
  final ITaskRepository repository;

  Future<Either<bool, String>> call({
    required String taskId,
    String? title,
    String? description,
    DateTime? dueDate,
    int? priority,
    String? categoryName,
    String? categoryIcon,
  }) async {
    final result = await repository.editTask(
      taskId: taskId,
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
      categoryName: categoryName,
      categoryIcon: categoryIcon,
    );
    return result;
  }
}
