import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_todo/core/log/app_logger.dart';
import 'package:up_todo/core/models/api_result.dart';
import 'package:up_todo/core/models/error_model.dart';
import 'package:up_todo/core/services/firebase_auth_service.dart';
import 'package:up_todo/core/services/firestore_service.dart';
import 'package:up_todo/features/auth/data/models/user_models.dart';

abstract class IAuthRemoteDataSource {
  Future<ApiResult<UserAuthModel>> register({
    required String email,
    required String password,
  });
  Future<ApiResult<UserAuthModel>> login({
    required String email,
    required String password,
  });
  Future<void> logout();
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  AuthRemoteDataSource({
    required this.firebaseAuth,
    required this.firestoreService,
  });
  final FirebaseAuthService firebaseAuth;
  final FirestoreService firestoreService;

  @override
  Future<ApiResult<UserAuthModel>> register({
    required String email,
    required String password,
  }) async {
    try {
      AppLogger.i(
        'Attempt register with email: $email and password: $password',
      );
      final credential = await firebaseAuth.register(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user != null) {
        await firestoreService.createUser(
          uid: user.uid,
          email: user.email ?? '',
          username: user.displayName,
        );
      }
      AppLogger.i('Register success: user = $user');
      return ApiResult.success(data: UserAuthModel.fromFirebaseUser(user!));
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Authentication error'),
      );
    } on Exception catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<UserAuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      AppLogger.i('Attempt login with email: $email and password: $password');
      final userCredential = await firebaseAuth.login(
        email: email,
        password: password,
      );
      AppLogger.i('Login success: user = ${userCredential.user}');
      return ApiResult.success(
        data: UserAuthModel.fromFirebaseUser(userCredential.user!),
      );
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(
        error: ApiErrorResponse(message: e.message ?? 'Authentication error'),
      );
    } on Exception catch (e) {
      AppLogger.e(e.toString());
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.logout();
  }
}
