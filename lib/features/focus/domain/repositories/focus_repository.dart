import 'package:either_dart/either.dart';

abstract class IFocusRepository {
  Future<Either<bool, String>> saveFocusTime({
    required String userId,
    required int durationSeconds,
    required int targetSeconds,
  });
}
