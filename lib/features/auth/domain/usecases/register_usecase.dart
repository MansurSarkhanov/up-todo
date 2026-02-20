import 'package:either_dart/either.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final IAuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<UserEntity, String>> call({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return repository.register(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
