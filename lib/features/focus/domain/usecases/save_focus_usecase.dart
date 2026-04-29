import 'package:either_dart/either.dart';
import 'package:up_todo/features/focus/domain/repositories/focus_repository.dart';

class SaveFocusUsecase {
  SaveFocusUsecase(this.repository);
  final IFocusRepository repository;

  Future<Either<bool, String>> call({
    required String userId,
    required int durationSeconds,
    required int targetSeconds,
  }) {
    return repository.saveFocusTime(
      userId: userId,
      durationSeconds: durationSeconds,
      targetSeconds: targetSeconds,
    );
  }
}
