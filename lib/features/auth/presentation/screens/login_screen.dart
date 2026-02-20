import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/core/routes/routes.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/features/auth/presentation/bloc/auth_state.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';
import 'package:up_todo/shared/components/custom_button.dart';

import '../../../../shared/components/custom_textfield.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../widgets/sosial_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: context.colors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                Text("Login", style: context.typography.h1Bold),
                24.verticalSpace,
                Text("Username", style: context.typography.body2Regular),
                8.verticalSpace,
                CustomTextfield(
                  controller: _emailController,
                  hintText: "Enter your Username",
                ),
                24.verticalSpace,
                Text("Password", style: context.typography.body2Regular),
                8.verticalSpace,
                CustomTextfield(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: "••••••••••••",
                ),
                40.verticalSpace,
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == AuthStatus.authenticated) {
                      context.pushReplacement(Routes.home);
                    } else if (state.status == AuthStatus.failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage ?? 'Login failed'),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.status == AuthStatus.loading,
                      text: "Login",
                      onTap: () {
                        context.read<AuthBloc>().add(
                          AuthLoginRequested(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                    );
                  },
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: context.colors.strokeColor)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "or",
                        style: context.typography.body2Regular.copyWith(
                          color: context.colors.strokeColor,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: context.colors.strokeColor)),
                  ],
                ),
                24.verticalSpace,
                SosialButton(
                  onTap: () {},
                  text: 'Login with Google',
                  iconPath: AppIconPath.google,
                ),
                16.verticalSpace,
                SosialButton(
                  onTap: () {},
                  text: 'Login with Apple',
                  iconPath: AppIconPath.apple,
                ),
                42.verticalSpace,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?  ",
                      style: context.typography.subtitle4Regular.copyWith(
                        color: context.colors.strokeColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: context.typography.subtitle4Bold,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(Routes.register);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
