import 'package:either_dart/either.dart';

import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<UserEntity, String>> register({
    required String email,
    required String password,
  });
  Future<Either<UserEntity, String>> login({
    required String email,
    required String password,
  });
  Future<void> logout();
}
