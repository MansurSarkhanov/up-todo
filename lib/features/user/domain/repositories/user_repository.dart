import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:up_todo/features/user/data/models/user_model.dart';

abstract class IUserRepository {
  Either<Stream<UserModel>, String> getUser(String uid);

  Future<Either<bool, String>> updateUser({
    required String uid,
    String? username,
    File? image,
    String? imageUrl,
  });
}
