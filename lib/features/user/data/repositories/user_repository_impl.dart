import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:up_todo/features/user/data/models/user_model.dart';
import 'package:up_todo/features/user/data/sources/user_remote_source.dart';
import 'package:up_todo/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserRemoteSource remoteSource;

  UserRepositoryImpl(this.remoteSource);
  @override
  Either<Stream<UserModel>, String> getUser(String uid) {
    final response = remoteSource.getUser(uid);
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }

  @override
  Future<Either<bool, String>> updateUser({
    required String uid,
    String? username,
    File? image,
    String? imageUrl,
  }) async {
    final response = await remoteSource.updateUser(
      uid: uid,
      username: username,
      image: image,
      imageUrl: imageUrl,
    );
    if (response.isSuccess) {
      return Left(response.data!);
    } else {
      return Right(response.error?.message ?? 'Unknown error');
    }
  }
}
