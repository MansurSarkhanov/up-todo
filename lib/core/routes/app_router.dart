import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/routes/routes.dart';
import 'package:up_todo/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:up_todo/features/onboarding/presentation/screens/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingScreen(),
    ),
  ],
);
