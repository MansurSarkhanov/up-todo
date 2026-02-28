import 'package:either_dart/either.dart';

import '../repositories/focus_repository.dart';

class SaveFocusUsecase {
  final IFocusRepository repository;

  SaveFocusUsecase(this.repository);

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
