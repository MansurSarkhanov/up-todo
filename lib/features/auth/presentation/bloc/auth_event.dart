import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class AuthRegisterRequested extends AuthEvent {
  const AuthRegisterRequested({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  final String email;
  final String password;
  final String confirmPassword;

  @override
  List<Object?> get props => [email, password, confirmPassword];
}

class AuthLogoutRequested extends AuthEvent {}

class AuthUserChanged extends AuthEvent {
  const AuthUserChanged(this.user);
  final User? user;

  @override
  List<Object?> get props => [user];
}
