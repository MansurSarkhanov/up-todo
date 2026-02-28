import 'package:either_dart/either.dart';
import 'package:up_todo/features/focus/data/sources/focus_remote_source.dart';

import '../../domain/repositories/focus_repository.dart';

class FocusRepositoryImpl implements IFocusRepository {
  final IFocusRemoteSource remoteSource;

  FocusRepositoryImpl(this.remoteSource);
  @override
  Future<Either<bool, String>> saveFocusTime({
    required String userId,
    required int durationSeconds,
    required int targetSeconds,
  }) async {
    final response = await remoteSource.saveFocusSession(
      userId: userId,
      durationSeconds: durationSeconds,
      targetSeconds: targetSeconds,
    );
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }
}
