import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_todo/core/services/cloudinary_service.dart';

import '../../../../core/log/app_logger.dart';
import '../../../../core/models/api_result.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/services/firestore_service.dart';
import '../models/user_model.dart';

abstract class IUserRemoteSource {
  ApiResult<Stream<UserModel>> getUser(String uid);
  Future<ApiResult<bool>> updateUser({
    required String uid,
    String? username,
    File? image,
    String? imageUrl,
  });
}

class UserRemoteSource extends IUserRemoteSource {
  final FirestoreService firestoreService;
  final CloudinaryService cloudinaryService;

  UserRemoteSource({
    required this.firestoreService,
    required this.cloudinaryService,
  });

  @override
  ApiResult<Stream<UserModel>> getUser(String uid) {
    try {
      AppLogger.i('Attempt get user for userId: $uid');
      final result = firestoreService.getUser(uid: uid);
      AppLogger.i('Successfully with result: $result');
      return ApiResult.success(data: result);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed to add task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<bool>> updateUser({
    required String uid,
    String? username,
    File? image,
    String? imageUrl,
  }) async {
    try {
      String? photoUrl;
      if (image != null) {
        photoUrl = await cloudinaryService.uploadImage(image);
      }
      AppLogger.i('Attempt get user for userId: $uid');
      await firestoreService.updateUser(
        uid: uid,
        photoUrl: photoUrl ?? imageUrl,
        username: username,
      );
      return ApiResult.success(data: true);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Failed to add task'),
      );
    } catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }
}
