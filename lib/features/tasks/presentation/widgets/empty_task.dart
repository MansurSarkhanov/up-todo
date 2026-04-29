import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/constants/images.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';

class EmptyTask extends StatelessWidget {
  const EmptyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(AppImagePath.emptyTask),
          ),
          8.verticalSpace,
          Text(
            'What do you want to do today?',
            style: context.typography.h6Regular,
          ),
          12.verticalSpace,
          Text(
            'Tap + to add your tasks',
            style: context.typography.subtitle2Regular,
          ),
        ],
      ),
    );
  }
}
