import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/routes/routes.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/animations/animated_button_effect.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

import '../bloc/passcode_bloc.dart';
import '../bloc/passcode_event.dart';
import '../bloc/passcode_state.dart';

part '../widgets/passcode_keypad.dart';

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({super.key, required this.mode});
  final PasscodeMode mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(toolbarHeight: 0),
      backgroundColor: context.colors.backgroundColor,
      body: BlocListener<PasscodeBloc, PasscodeState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.replace(Routes.main);
          } else if (state.isError) {
            if (mode == PasscodeMode.setup) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Passcode does not match')),
              );
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Invalid PIN!')));
            }
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [context.colors.primary, Color(0xFF6C63FF)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.colors.primary.withValues(alpha: .5),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: const Icon(Icons.lock, color: Colors.white, size: 30),
              ),
              16.verticalSpace,
              Text(
                mode == PasscodeMode.login
                    ? "Enter Passcode"
                    : "Set Your Passcode",
                style: context.typography.h3SemiBold,
              ),
              8.verticalSpace,
              Text(
                mode == PasscodeMode.login
                    ? "Enter your 4-digit security code"
                    : "Create a 4-digit code and confirm",
                style: context.typography.subtitle4Regular.copyWith(
                  color: Colors.white54,
                ),
              ),
              32.verticalSpace,
              BlocBuilder<PasscodeBloc, PasscodeState>(
                builder: (context, state) {
                  if (mode == PasscodeMode.setup) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildPinRow(state.enteredPin, context),
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubic,
                          child: state.enteredPin.length == 4
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: buildPinRow(
                                    state.confirmEnteredPin,
                                    context,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    );
                  } else {
                    // Login row
                    return buildPinRow(state.enteredPin, context);
                  }
                },
              ),
              Spacer(),
              PasscodeKeypad(),
              24.verticalSpace,
              Text(
                "Forgot PIN?",
                style: context.typography.body2SemiBold.copyWith(
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPinRow(List<int> pin, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isFilled = index < pin.length;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 14.w,
          width: 14.w,
          decoration: BoxDecoration(
            boxShadow: [
              isFilled
                  ? BoxShadow(
                      color: context.colors.primary.withValues(alpha: .5),
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  : const BoxShadow(),
            ],
            shape: BoxShape.circle,
            color: isFilled ? context.colors.primary : const Color(0xFF2A2A35),
          ),
        );
      }),
    );
  }
}

enum PasscodeMode { login, setup }
