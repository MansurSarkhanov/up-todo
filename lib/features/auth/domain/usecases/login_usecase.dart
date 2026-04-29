import 'package:either_dart/either.dart';
import 'package:up_todo/core/utils/regex/email_regex.dart';
import 'package:up_todo/features/auth/domain/entities/user_entity.dart';
import 'package:up_todo/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  LoginUseCase(this.repository);
  final IAuthRepository repository;

  Future<Either<UserEntity, String>> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return const Right('All fields are required');
    }
    if (!EmailRegex.emailRegex.hasMatch(email)) {
      return const Right('Invalid email address');
    }
    final result = await repository.login(email: email, password: password);
    return result;
  }
}
