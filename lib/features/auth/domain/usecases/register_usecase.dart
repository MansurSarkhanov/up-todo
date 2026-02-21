import 'package:either_dart/either.dart';
import 'package:up_todo/core/utils/regex/email_regex.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final IAuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<UserEntity, String>> call({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return Right("All fields are required");
    }
    if (password.length < 6) {
      return Right("Password must be at least 6 characters");
    }
    if (password != confirmPassword) {
      return Right("Passwords do not match");
    }
    if (!EmailRegex.emailRegex.hasMatch(email)) {
      return Right("Invalid email address");
    }
    return repository.register(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
