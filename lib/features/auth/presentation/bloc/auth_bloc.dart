import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/auth/domain/usecases/register_usecase.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUsecase registerUseCase;

  final FirebaseAuthService firebaseAuth;

  StreamSubscription<User?>? _userSubscription;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.firebaseAuth,
  }) : super(const AuthState()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    // on<AuthLogoutRequested>(_onLogoutRequested);
    // on<AuthUserChanged>(_onUserChanged);

    _userSubscription = firebaseAuth.authStateChanges.listen((user) {
      add(AuthCheckRequested());
    });
  }

  void _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: UserEntity(uid: user.uid, email: user.email ?? ''),
        ),
      );
    } else {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await loginUseCase(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (user) =>
          emit(state.copyWith(status: AuthStatus.authenticated, user: user)),
      (error) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: error.toString(),
        ),
      ),
    );
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    final result = await registerUseCase(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (user) =>
          emit(state.copyWith(status: AuthStatus.authenticated, user: user)),
      (error) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: error.toString(),
        ),
      ),
    );
  }

  // Future<void> _onLogoutRequested(
  //   AuthLogoutRequested event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   await logoutUseCase();
  //   emit(state.copyWith(status: AuthStatus.unauthenticated));
  // }

  // void _onUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
  //   if (event.user != null) {
  //     emit(
  //       state.copyWith(
  //         status: AuthStatus.authenticated,
  //         user: UserEntity(uid: event.user.uid, email: event.user.email ?? ''),
  //       ),
  //     );
  //   } else {
  //     emit(state.copyWith(status: AuthStatus.unauthenticated));
  //   }
  // }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
