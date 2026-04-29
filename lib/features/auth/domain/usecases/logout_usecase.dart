import 'package:up_todo/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  LogoutUseCase(this.repository);
  final IAuthRepository repository;

  Future<void> call() async {
    await repository.logout();
  }
}
