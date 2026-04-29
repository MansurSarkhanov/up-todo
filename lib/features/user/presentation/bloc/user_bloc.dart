import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/user/data/models/user_model.dart';
import 'package:up_todo/features/user/domain/usecases/update_user_usecase.dart';
import 'package:up_todo/features/user/domain/usecases/user_usecase.dart';
import 'package:up_todo/features/user/presentation/bloc/user_event.dart';
import 'package:up_todo/features/user/presentation/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userUsecase, required this.updateUserUsecase})
    : super(UserInitial()) {
    on<LoadUser>(_onLoadUser);
    // on<UpdateUserOnlineStatus>(_onUpdateUserOnlineStatus);
    on<UpdateUserProfile>(_onUpdateUserProfile);
  }
  final UserUsecase userUsecase;
  final UpdateUserUsecase updateUserUsecase;

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    final result = userUsecase(event.uid);

    return result.fold(
      (stream) async {
        await emit.forEach<UserModel>(
          stream,
          onData: UserLoaded.new,
        );
      },
      (error) {
        emit(UserError(error));
      },
    );
  }

  // Future<void> _onUpdateUserOnlineStatus(
  //     UpdateUserOnlineStatus event, Emitter<UserState> emit) async {
  //   if (state is UserLoaded) {
  //     final currentUser = (state as UserLoaded).user;
  //     try {
  //       await userUsecase.repository.updateUser(
  //         currentUser.copyWith(
  //           isOnline: event.isOnline,
  //           lastSeen: DateTime.now(),
  //         ),
  //       );
  //     } catch (e) {
  //       emit(UserError(e.toString()));
  //     }
  //   }
  // }

  Future<void> _onUpdateUserProfile(
    UpdateUserProfile event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserLoaded) {
      final currentUser = (state as UserLoaded).user;
      final updatedUser = currentUser.copyWith(
        username: event.username ?? currentUser.username,
        photoUrl: currentUser.photoUrl,
      );
      try {
        await updateUserUsecase(
          uid: currentUser.id,
          username: updatedUser.username,
          image: event.image,
          imageUrl: updatedUser.photoUrl,
        );
        emit(UserLoaded(updatedUser));
      } on Exception catch (e) {
        emit(UserError(e.toString()));
      }
    }
  }
}
