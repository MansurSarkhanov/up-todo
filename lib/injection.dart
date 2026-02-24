import 'package:get_it/get_it.dart';
import 'package:up_todo/core/helpers/cache_manager.dart';
import 'package:up_todo/core/services/cloudinary_service.dart';
import 'package:up_todo/core/services/firebase_auth_service.dart';
import 'package:up_todo/features/auth/domain/repositories/auth_repository.dart';
import 'package:up_todo/features/main/presentation/bloc/main_bloc.dart';
import 'package:up_todo/features/tasks/data/sources/task_remote_source.dart';
import 'package:up_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:up_todo/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:up_todo/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:up_todo/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:up_todo/features/user/data/repositories/user_repository_impl.dart';
import 'package:up_todo/features/user/data/sources/user_remote_source.dart';
import 'package:up_todo/features/user/domain/repositories/user_repository.dart';
import 'package:up_todo/features/user/domain/usecases/update_user_usecase.dart';
import 'package:up_todo/features/user/domain/usecases/user_usecase.dart';
import 'package:up_todo/features/user/presentation/bloc/user_bloc.dart';

import 'core/helpers/picker_manager.dart';
import 'core/services/firestore_service.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/data/sources/auth_remote_source.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/tasks/data/repositories/task_repository_impl.dart';
import 'features/tasks/domain/usecases/watch_task_usecase.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Bloc
  getIt.registerFactory(
    () => AuthBloc(
      logoutUseCase: getIt<LogoutUseCase>(),
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUsecase>(),
      firebaseAuth: getIt<FirebaseAuthService>(),
    ),
  );
  getIt.registerFactory(() => MainBloc());
  getIt.registerFactory(
    () => TaskBloc(
      watchTaskUsecase: getIt<WatchTaskUsecase>(),
      addTaskUsecase: getIt<AddTaskUsecase>(),
      getTasksUsecase: getIt<GetTasksUsecase>(),
    ),
  );
  getIt.registerFactory(
    () => UserBloc(
      userUsecase: getIt<UserUsecase>(),
      updateUserUsecase: getIt<UpdateUserUsecase>(),
    ),
  );
  // Usecases
  getIt.registerLazySingleton(() => LoginUseCase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton(() => RegisterUsecase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton(() => AddTaskUsecase(getIt<ITaskRepository>()));
  getIt.registerLazySingleton(() => GetTasksUsecase(getIt<ITaskRepository>()));
  getIt.registerLazySingleton(() => WatchTaskUsecase(getIt<ITaskRepository>()));
  getIt.registerLazySingleton(() => UserUsecase(getIt<IUserRepository>()));
  getIt.registerLazySingleton(
    () => UpdateUserUsecase(getIt<IUserRepository>()),
  );

  // Repositories
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: getIt<IAuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton<ITaskRepository>(
    () => TaskRepositoryImpl(remoteSource: getIt<ITaskRemoteSource>()),
  );
  getIt.registerLazySingleton<IUserRepository>(
    () => UserRepositoryImpl(getIt<IUserRemoteSource>()),
  );
  // Data sources
  getIt.registerLazySingleton<IAuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      firebaseAuth: getIt<FirebaseAuthService>(),
      firestoreService: getIt<FirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<ITaskRemoteSource>(
    () => TaskRemoteSource(firestoreService: getIt<FirestoreService>()),
  );
  getIt.registerLazySingleton<IUserRemoteSource>(
    () => UserRemoteSource(
      firestoreService: getIt<FirestoreService>(),
      cloudinaryService: getIt<CloudinaryService>(),
    ),
  );
  //! External
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());
  getIt.registerLazySingleton<CacheManager>(() => CacheManager());
  getIt.registerLazySingleton<CloudinaryService>(() => CloudinaryService());
  getIt.registerLazySingleton<PickerManager>(() => PickerManager());
}
