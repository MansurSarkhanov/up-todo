import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';
import 'package:up_todo/shared/components/custom_button.dart';

import '../../../../shared/components/custom_textfield.dart';
import '../widgets/sosial_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                Text("Register", style: context.typography.h1Bold),
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
                24.verticalSpace,
                Text(
                  "Confirm Password",
                  style: context.typography.body2Regular,
                ),
                8.verticalSpace,
                CustomTextfield(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  hintText: "••••••••••••",
                ),
                40.verticalSpace,
                CustomButton(text: "Register", onTap: () {}),
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
                  text: 'Register with Google',
                  iconPath: AppIconPath.google,
                ),
                16.verticalSpace,
                SosialButton(
                  onTap: () {},
                  text: 'Register with Apple',
                  iconPath: AppIconPath.apple,
                ),
                30.verticalSpace,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: context.typography.subtitle4Regular.copyWith(
                        color: context.colors.strokeColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: context.typography.subtitle4Bold,
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
