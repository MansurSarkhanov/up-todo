import 'package:get_it/get_it.dart';
import 'package:up_todo/core/helpers/cache_manager.dart';
import 'package:up_todo/core/helpers/picker_manager.dart';
import 'package:up_todo/core/services/cloudinary_service.dart';
import 'package:up_todo/core/services/firebase_auth_service.dart';
import 'package:up_todo/core/services/firestore_service.dart';
import 'package:up_todo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:up_todo/features/auth/data/sources/auth_remote_source.dart';
import 'package:up_todo/features/auth/domain/repositories/auth_repository.dart';
import 'package:up_todo/features/auth/domain/usecases/login_usecase.dart';
import 'package:up_todo/features/auth/domain/usecases/logout_usecase.dart';
import 'package:up_todo/features/auth/domain/usecases/register_usecase.dart';
import 'package:up_todo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:up_todo/features/focus/data/repositories/focus_repository_impl.dart';
import 'package:up_todo/features/focus/data/sources/focus_remote_source.dart';
import 'package:up_todo/features/focus/domain/repositories/focus_repository.dart';
import 'package:up_todo/features/focus/domain/usecases/save_focus_usecase.dart';
import 'package:up_todo/features/focus/presentation/bloc/focus_bloc.dart';
import 'package:up_todo/features/main/presentation/bloc/main_bloc.dart';
import 'package:up_todo/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:up_todo/features/tasks/data/sources/task_remote_source.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:up_todo/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:up_todo/features/tasks/domain/usecases/complate_task_usecase.dart';
import 'package:up_todo/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:up_todo/features/tasks/domain/usecases/edit_task_usecase.dart';
import 'package:up_todo/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:up_todo/features/tasks/domain/usecases/watch_task_usecase.dart';
import 'package:up_todo/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:up_todo/features/user/data/repositories/user_repository_impl.dart';
import 'package:up_todo/features/user/data/sources/user_remote_source.dart';
import 'package:up_todo/features/user/domain/repositories/user_repository.dart';
import 'package:up_todo/features/user/domain/usecases/update_user_usecase.dart';
import 'package:up_todo/features/user/domain/usecases/user_usecase.dart';
import 'package:up_todo/features/user/presentation/bloc/user_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Bloc
  getIt
    ..registerFactory(
      () => AuthBloc(
        logoutUseCase: getIt<LogoutUseCase>(),
        loginUseCase: getIt<LoginUseCase>(),
        registerUseCase: getIt<RegisterUsecase>(),
        firebaseAuth: getIt<FirebaseAuthService>(),
      ),
    )
    ..registerFactory(MainBloc.new)
    ..registerFactory(
      () => TaskBloc(
        complateTaskUsecase: getIt<ComplateTaskUsecase>(),
        deleteTaskUsecase: getIt<DeleteTaskUsecase>(),
        editTaskUsecase: getIt<EditTaskUsecase>(),
        watchTaskUsecase: getIt<WatchTaskUsecase>(),
        addTaskUsecase: getIt<AddTaskUsecase>(),
        getTasksUsecase: getIt<GetTasksUsecase>(),
      ),
    )
    ..registerFactory(
      () => UserBloc(
        userUsecase: getIt<UserUsecase>(),
        updateUserUsecase: getIt<UpdateUserUsecase>(),
      ),
    )
    ..registerFactory(
      () => FocusBloc(saveFocusUsecase: getIt<SaveFocusUsecase>()),
    )
    ..registerLazySingleton(() => LoginUseCase(getIt<IAuthRepository>()))
    ..registerLazySingleton(
      () => RegisterUsecase(getIt<IAuthRepository>()),
    )
    ..registerLazySingleton(() => LogoutUseCase(getIt<IAuthRepository>()))
    ..registerLazySingleton(() => AddTaskUsecase(getIt<ITaskRepository>()))
    ..registerLazySingleton(
      () => GetTasksUsecase(getIt<ITaskRepository>()),
    )
    ..registerLazySingleton(
      () => WatchTaskUsecase(getIt<ITaskRepository>()),
    )
    ..registerLazySingleton(() => EditTaskUsecase(getIt<ITaskRepository>()))
    ..registerLazySingleton(
      () => ComplateTaskUsecase(getIt<ITaskRepository>()),
    )
    ..registerLazySingleton(
      () => DeleteTaskUsecase(getIt<ITaskRepository>()),
    )
    ..registerLazySingleton(
      () => UserUsecase(getIt<IUserRepository>()),
    )
    ..registerLazySingleton(
      () => UpdateUserUsecase(getIt<IUserRepository>()),
    )
    ..registerLazySingleton(
      () => SaveFocusUsecase(getIt<IFocusRepository>()),
    )
    ..registerLazySingleton<IAuthRepository>(
      () =>
          AuthRepositoryImpl(remoteDataSource: getIt<IAuthRemoteDataSource>()),
    )
    ..registerLazySingleton<ITaskRepository>(
      () => TaskRepositoryImpl(remoteSource: getIt<ITaskRemoteSource>()),
    )
    ..registerLazySingleton<IUserRepository>(
      () => UserRepositoryImpl(getIt<IUserRemoteSource>()),
    )
    ..registerLazySingleton<IFocusRepository>(
      () => FocusRepositoryImpl(getIt<IFocusRemoteSource>()),
    )
    ..registerLazySingleton<IAuthRemoteDataSource>(
      () => AuthRemoteDataSource(
        firebaseAuth: getIt<FirebaseAuthService>(),
        firestoreService: getIt<FirestoreService>(),
      ),
    )
    ..registerLazySingleton<ITaskRemoteSource>(
      () => TaskRemoteSource(firestoreService: getIt<FirestoreService>()),
    )
    ..registerLazySingleton<IUserRemoteSource>(
      () => UserRemoteSource(
        firestoreService: getIt<FirestoreService>(),
        cloudinaryService: getIt<CloudinaryService>(),
      ),
    )
    ..registerLazySingleton<IFocusRemoteSource>(
      () => FocusRemoteSource(firestoreService: getIt<FirestoreService>()),
    )
    ..registerLazySingleton<FirebaseAuthService>(FirebaseAuthService.new)
    ..registerLazySingleton<FirestoreService>(FirestoreService.new)
    ..registerLazySingleton<CacheManager>(CacheManager.new)
    ..registerLazySingleton<CloudinaryService>(CloudinaryService.new)
    ..registerLazySingleton<PickerManager>(PickerManager.new);
}
