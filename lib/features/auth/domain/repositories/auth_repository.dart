import 'package:either_dart/either.dart';
import 'package:up_todo/features/auth/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<UserEntity, String>> register({
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<Either<UserEntity, String>> login({
    required String email,
    required String password,
  });
  Future<void> logout();
}
