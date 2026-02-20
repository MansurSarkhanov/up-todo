import 'package:up_todo/core/models/api_result.dart';

import '../../../../core/log/app_logger.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../models/user_models.dart';

abstract class IAuthRemoteDataSource {
  Future<ApiResult<UserModel>> register({
    required String email,
    required String password,
  });
  Future<ApiResult<UserModel>> login({
    required String email,
    required String password,
  });
  Future<void> logout();
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final FirebaseAuthService firebaseAuth;

  AuthRemoteDataSource({required this.firebaseAuth});

  @override
  Future<ApiResult<UserModel>> register({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.register(
        email: email,
        password: password,
      );
      return ApiResult.success(
        data: UserModel.fromFirebaseUser(userCredential.user!),
      );
    } catch (e) {
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<UserModel>> login({
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
        data: UserModel.fromFirebaseUser(userCredential.user!),
      );
    } catch (e, s) {
      AppLogger.e('Login failed', e, DateTime.now(), s);
      return ApiResult.failure(error: ApiErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.logout();
  }
}
