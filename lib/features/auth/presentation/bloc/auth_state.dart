import 'package:equatable/equatable.dart';
import 'package:up_todo/features/auth/domain/entities/user_entity.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, failure }

enum AuthScreen { login, register }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
    this.source,
  });
  final AuthStatus status;
  final UserEntity? user;
  final String? errorMessage;
  final AuthScreen? source;

  AuthState copyWith({
    AuthStatus? status,
    UserEntity? user,
    String? errorMessage,
    AuthScreen? source,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage, source];
}
