import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:up_todo/core/models/api_result.dart';
import 'package:up_todo/core/services/firestore_service.dart';

import '../../../../core/log/app_logger.dart';
import '../../../../core/models/error_model.dart';

abstract class IFocusRemoteSource {
  Future<ApiResult<bool>> saveFocusSession({
    required String userId,
    required int durationSeconds,
    required int targetSeconds,
  });
}

class FocusRemoteSource implements IFocusRemoteSource {
  final FirestoreService firestoreService;

  FocusRemoteSource({required this.firestoreService});
  @override
  Future<ApiResult<bool>> saveFocusSession({
    required String userId,
    required int durationSeconds,
    required int targetSeconds,
  }) async {
    try {
      AppLogger.i(
        'Attempt add focus session with userId: $userId, durationSeconds: $durationSeconds, targetSeconds: $targetSeconds',
      );
      await firestoreService.saveFocusSession(
        userId: userId,
        durationSeconds: durationSeconds,
        targetSeconds: targetSeconds,
      );
      AppLogger.i('Focus added successfully with result');
      return ApiResult.success(data: true);
    } on FirebaseException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed to add task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }
}
