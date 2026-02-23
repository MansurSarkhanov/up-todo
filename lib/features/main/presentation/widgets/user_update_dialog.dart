import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/features/user/presentation/bloc/user_bloc.dart';
import 'package:up_todo/shared/components/custom_textfield.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_button.dart';
import '../../../user/presentation/bloc/user_event.dart';

class UserUpdateDialog extends StatefulWidget {
  const UserUpdateDialog({super.key, required this.title});
  final String title;

  @override
  State<UserUpdateDialog> createState() => _UserUpdateDialogState();
}

class _UserUpdateDialogState extends State<UserUpdateDialog> {
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Change username", style: context.typography.body1SemiBold),
            12.verticalSpace,
            Divider(color: context.colors.strokeColor, height: 0),
            16.verticalSpace,
            Form(
              key: formKey,
              child: CustomTextfield(
                fillColor: Colors.transparent,
                controller: usernameController..text = widget.title,
                hintText: 'Username',
                textColor: Colors.white,
                hintTextColor: Color(0xFFAFAFAF),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    color: Colors.transparent,
                    clickColor: context.colors.primary.withValues(alpha: 0.1),
                    textColor: context.colors.primary,
                    text: 'Cancel',
                    onTap: () => context.pop(),
                  ),
                ),
                6.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    text: 'Edit',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<UserBloc>().add(
                          UpdateUserProfile(username: usernameController.text),
                        );
                        context.pop();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
