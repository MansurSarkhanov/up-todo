import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/constants/images.dart';
import 'package:up_todo/core/helpers/cache_manager.dart';
import 'package:up_todo/core/routes/routes.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/features/auth/presentation/screens/passcode_screen.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(toolbarHeight: 0),
      backgroundColor: context.colors.backgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          final status = state.status;
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              if (status == AuthStatus.authenticated) {
                final passcode = CacheManager.getData<String>('user_pin');
                if (passcode != null) {
                  context.replace(Routes.passcode, extra: PasscodeMode.login);
                } else {
                  context.replace(Routes.passcode, extra: PasscodeMode.setup);
                }
              } else if (status == AuthStatus.unauthenticated) {
                final isFirst = CacheManager.getData<bool>('isFirst');
                if (isFirst == true) {
                  context.replace(Routes.login);
                } else {
                  context.replace(Routes.onboarding);
                }
              }
            }
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Image.asset(AppImagePath.appLogo),
              ),
              16.verticalSpace,
              Text('UpTodo', style: context.typography.h1SemiBold),
            ],
          ),
        ),
      ),
    );
  }
}
