import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';

class TaskOverview extends StatelessWidget {
  const TaskOverview({
    super.key,
    required this.doneTaskCount,
    required this.leftTaskCount,
  });
  final int doneTaskCount;
  final int leftTaskCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: context.colors.secondary,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  '$doneTaskCount Task left',
                  style: context.typography.body1Regular,
                ),
              ),
            ),
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: context.colors.secondary,
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  '$leftTaskCount Task done',
                  style: context.typography.body1Regular,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
