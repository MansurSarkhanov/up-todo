import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:up_todo/features/tasks/presentation/bloc/task_event.dart';
import 'package:up_todo/shared/components/custom_textfield.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_button.dart';
import '../bloc/task_bloc.dart';

class TaskEditDialog extends StatefulWidget {
  const TaskEditDialog({
    super.key,
    required this.title,
    required this.description,
    required this.taskId,
  });
  final String title;
  final String description;
  final String taskId;

  @override
  State<TaskEditDialog> createState() => _TaskEditDialogState();
}

class _TaskEditDialogState extends State<TaskEditDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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
            Text("Edit Task title", style: context.typography.body1SemiBold),
            12.verticalSpace,
            Divider(color: context.colors.strokeColor, height: 0),
            16.verticalSpace,
            CustomTextfield(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.strokeColor,
                  width: 0.2,
                ),
              ),
              fillColor: Colors.transparent,
              controller: titleController..text = widget.title,
              hintText: 'Title',
              textColor: Colors.white,
              hintTextColor: Color(0xFFAFAFAF),
              textInputAction: TextInputAction.done,
            ),
            12.verticalSpace,
            CustomTextfield(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.strokeColor,
                  width: 0.2,
                ),
              ),
              fillColor: Colors.transparent,
              controller: descriptionController..text = widget.description,
              hintText: 'Description',
              textColor: Colors.white,
              hintTextColor: Color(0xFFAFAFAF),
              textInputAction: TextInputAction.done,
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
                      final userId = context.read<AuthBloc>().state.user?.uid;
                      context.read<TaskBloc>().add(
                        EditTaskRequested(
                          taskId: widget.taskId,
                          userId: userId!,
                          title: titleController.text,
                          description: descriptionController.text,
                        ),
                      );
                      context.pop();
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
