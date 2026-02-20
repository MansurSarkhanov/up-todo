import 'package:either_dart/either.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final IAuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<UserEntity, String>> call({
    required String email,
    required String password,
  }) {
    return repository.register(email: email, password: password);
  }
}
