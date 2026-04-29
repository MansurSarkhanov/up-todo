import 'package:either_dart/either.dart';
import 'package:up_todo/features/auth/data/sources/auth_remote_source.dart';
import 'package:up_todo/features/auth/domain/entities/user_entity.dart';
import 'package:up_todo/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({required this.remoteDataSource});
  final IAuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<UserEntity, String>> register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await remoteDataSource.register(
      email: email,
      password: password,
    );
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error!.message);
    }
  }

  @override
  Future<Either<UserEntity, String>> login({
    required String email,
    required String password,
  }) async {
    final response = await remoteDataSource.login(
      email: email,
      password: password,
    );
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error!.message);
    }
  }

  @override
  Future<void> logout() {
    return remoteDataSource.logout();
  }
}
