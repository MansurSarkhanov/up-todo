import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/helpers/cache_manager.dart';
import 'package:up_todo/core/routes/app_router.dart';
import 'package:up_todo/core/theme/theme_scope.dart';
import 'package:up_todo/core/theme/theme_scope_widget.dart';
import 'package:up_todo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:up_todo/features/main/presentation/bloc/main_bloc.dart';
import 'package:up_todo/firebase_options.dart';
import 'package:up_todo/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  await CacheManager.init();
  runApp(const ThemeScopeWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context);
    final extensions = <ThemeExtension<dynamic>>[
      theme.appTypography,
      theme.appColors,
    ];
    return PopScope(
      canPop: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<AuthBloc>()),
          BlocProvider(create: (_) => getIt<MainBloc>()),
        ],
        child: MaterialApp.router(
          theme: ThemeData(extensions: extensions),
          debugShowCheckedModeBanner: false,
          title: 'Up Todo',
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
