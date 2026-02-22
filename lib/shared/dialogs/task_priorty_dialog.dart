import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/shared/animations/animated_button_effect.dart';
import 'package:up_todo/shared/components/custom_button.dart';

import '../../core/utils/extensions/context_extension.dart';

class TaskPriorityDialog extends StatefulWidget {
  final int? initialPriority;

  const TaskPriorityDialog({super.key, this.initialPriority});

  @override
  State<TaskPriorityDialog> createState() => _TaskPriorityDialogState();
}

class _TaskPriorityDialogState extends State<TaskPriorityDialog> {
  int? selectedPriority;

  @override
  void initState() {
    super.initState();
    selectedPriority = widget.initialPriority;
  }

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
            Text("Task Priority", style: context.typography.body1SemiBold),
            12.verticalSpace,
            Divider(color: context.colors.strokeColor, height: 0),
            16.verticalSpace,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final priority = index + 1;
                final isSelected = selectedPriority == priority;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPriority = priority;
                    });
                  },
                  child: AnimationButtonEffect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? context.colors.primary
                            : Colors.black26,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIconPath.flag),
                          8.verticalSpace,
                          Text(
                            priority.toString(),
                            style: context.typography.subtitle4Bold.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    color: Colors.transparent,
                    textColor: context.colors.primary,
                    text: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                6.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    text: 'Save',
                    onTap: () {
                      Navigator.pop(context, selectedPriority);
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
