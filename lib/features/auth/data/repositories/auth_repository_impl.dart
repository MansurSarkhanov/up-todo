import 'package:either_dart/either.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/auth_remote_source.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<UserEntity, String>> register({
    required String email,
    required String password,
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
