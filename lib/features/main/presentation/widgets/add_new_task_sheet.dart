import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_todo/shared/dialogs/task_priorty_dialog.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_textfield.dart';
import '../../../../shared/dialogs/custom_calendart_dialog.dart';

class AddNewTaskSheet extends StatelessWidget {
  const AddNewTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Task', style: context.typography.h5Bold),
              12.verticalSpace,
              CustomTextfield(
                textInputAction: TextInputAction.next,
                hintTextColor: Color(0xFFAFAFAF),
                fillColor: Colors.transparent,
                controller: TextEditingController(),
                hintText: 'Task Title',
              ),
              8.verticalSpace,
              CustomTextfield(
                hintTextColor: Color(0xFFAFAFAF),
                fillColor: Colors.transparent,
                controller: TextEditingController(),
                hintText: 'Task Description',
              ),
              16.verticalSpace,
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(AppIconPath.timer),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const CustomCalendarDialog(),
                      );
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(AppIconPath.tag),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(AppIconPath.flag),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const TaskPriorityDialog(),
                      );
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: SvgPicture.asset(AppIconPath.send),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
