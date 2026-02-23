import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:up_todo/features/user/domain/repositories/user_repository.dart';

class UpdateUserUsecase {
  final IUserRepository repository;
  UpdateUserUsecase(this.repository);
  Future<Either<bool, String>> call({
    required String uid,
    String? username,
    File? image,
    String? imageUrl,
  }) async {
    final result = await repository.updateUser(
      uid: uid,
      username: username,
      image: image,
      imageUrl: imageUrl,
    );
    return result;
  }
}
