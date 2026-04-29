import 'package:either_dart/either.dart';
import 'package:up_todo/core/utils/regex/email_regex.dart';
import 'package:up_todo/features/auth/domain/entities/user_entity.dart';
import 'package:up_todo/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  RegisterUsecase(this.repository);
  final IAuthRepository repository;

  Future<Either<UserEntity, String>> call({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return const Right('All fields are required');
    }
    if (password.length < 6) {
      return const Right('Password must be at least 6 characters');
    }
    if (password != confirmPassword) {
      return const Right('Passwords do not match');
    }
    if (!EmailRegex.emailRegex.hasMatch(email)) {
      return const Right('Invalid email address');
    }
    return repository.register(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
