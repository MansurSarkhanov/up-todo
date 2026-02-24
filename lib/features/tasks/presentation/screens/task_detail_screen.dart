import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      appBar: CustomAppBar(
        actions: [
          CNButton.icon(
            icon: CNSymbol('arrow.left.arrow.right', size: 16),
            onPressed: () => context.pop(),
          ),
          16.horizontalSpace,
        ],
      ),
    );
  }
}
