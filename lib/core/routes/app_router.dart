import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/routes/routes.dart';
import 'package:up_todo/features/auth/presentation/screens/login_screen.dart';
import 'package:up_todo/features/auth/presentation/screens/register_screen.dart';
import 'package:up_todo/features/main/presentation/screens/main_screen.dart';
import 'package:up_todo/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:up_todo/features/onboarding/presentation/screens/splash_screen.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/main/presentation/screens/setting_screen.dart';
import '../../features/onboarding/bloc/onboarding_bloc.dart';
import '../../features/onboarding/presentation/widgets/onboard_content.dart';
import '../../injection.dart';
import 'route_notifier.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.splash,
  refreshListenable: RouteNotifier(getIt<AuthBloc>().stream),
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;

    final isLoggedIn = authState.status == AuthStatus.authenticated;

    final isGoingToLogin = state.matchedLocation == Routes.login;

    if (!isLoggedIn && state.matchedLocation == Routes.main) {
      return Routes.login;
    }

    if (isLoggedIn && isGoingToLogin) {
      return Routes.main;
    }

    return null;
  },
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
    GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(path: Routes.main, builder: (context, state) => MainScreen()),
    GoRoute(
      path: Routes.setting,
      builder: (context, state) => const SettingScreen(),
    ),
  ],
);
