import 'package:get_it/get_it.dart';
import 'package:up_todo/core/services/firebase_auth_service.dart';
import 'package:up_todo/features/auth/domain/repositories/auth_repository.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/data/sources/auth_remote_source.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(
    () => AuthBloc(
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUsecase>(),
      firebaseAuth: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerLazySingleton(() => LoginUseCase(getIt<IAuthRepository>()));
  getIt.registerLazySingleton(() => RegisterUsecase(getIt<IAuthRepository>()));

  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: getIt<IAuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<IAuthRemoteDataSource>(
    () => AuthRemoteDataSource(firebaseAuth: getIt<FirebaseAuthService>()),
  );

  //! External
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
}
