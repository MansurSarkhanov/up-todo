import 'package:either_dart/either.dart';

import '../../../../core/utils/regex/email_regex.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<UserEntity, String>> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return Right("All fields are required");
    }
    if (!EmailRegex.emailRegex.hasMatch(email)) {
      return Right("Invalid email address");
    }
    final result = await repository.login(email: email, password: password);
    return result;
  }
}
