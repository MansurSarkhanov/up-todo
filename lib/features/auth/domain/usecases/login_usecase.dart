import 'package:either_dart/either.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<UserEntity, String>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
