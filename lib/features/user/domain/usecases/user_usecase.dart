import 'package:either_dart/either.dart';
import 'package:up_todo/features/user/data/models/user_model.dart';
import 'package:up_todo/features/user/domain/repositories/user_repository.dart';

class UserUsecase {
  UserUsecase(this.repository);
  final IUserRepository repository;

  Either<Stream<UserModel>, String> call(String uid) {
    final result = repository.getUser(uid);
    return result;
  }
}
