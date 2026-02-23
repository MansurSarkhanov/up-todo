import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserAuthModel extends UserEntity {
  UserAuthModel({required super.uid, required super.email});

  factory UserAuthModel.fromFirebaseUser(User user) {
    return UserAuthModel(uid: user.uid, email: user.email ?? '');
  }
}
