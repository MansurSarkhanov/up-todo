import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/routes/routes.dart';
import 'package:up_todo/features/auth/presentation/screens/login_screen.dart';
import 'package:up_todo/features/auth/presentation/screens/register_screen.dart';
import 'package:up_todo/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:up_todo/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:up_todo/injection.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/onboarding/bloc/onboarding_bloc.dart';
import '../../features/onboarding/presentation/widgets/onboard_content.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.login,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => BlocProvider(
        create: (_) =>
            OnboardingBloc(pageCount: OnboardingModel.contents.length),
        child: OnboardingScreen(),
      ),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) =>
          BlocProvider(create: (_) => getIt<AuthBloc>(), child: LoginScreen()),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<AuthBloc>(),
        child: RegisterScreen(),
      ),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => Scaffold()),
  ],
);
