import 'package:up_todo/features/user/data/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  UserLoaded(this.user);
  final UserModel user;
}

class UserError extends UserState {
  UserError(this.message);
  final String message;
}
