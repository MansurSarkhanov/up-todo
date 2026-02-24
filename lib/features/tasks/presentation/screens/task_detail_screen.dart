import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/features/tasks/presentation/widgets/task_edit_dialog.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

import '../../../../core/helpers/date_helper.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_state.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.color});
  final Color color;
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
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.status == TaskStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == TaskStatus.failure) {
            return Center(child: Text(state.error ?? 'Something went wrong'));
          } else if (state.watchedTask == null) {
            return const Center(child: Text('Task not found'));
          }

          final task = state.watchedTask!;
          final formattedDue = DateHelper.instance.formatToDayMonthYear(
            task.dueDate,
          );
          final formattedCreate = DateHelper.instance.formatToDayMonthYear(
            task.createDate,
          );

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(task.title, style: context.typography.h5Medium),
                    CNButton.icon(
                      icon: CNSymbol('pencil.line', size: 18),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: context.read<TaskBloc>(),
                            child: TaskEditDialog(
                              taskId: task.id,
                              title: task.title,
                              description: task.description,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  task.description,
                  style: context.typography.body1Regular.copyWith(
                    color: Color(0xFFAFAFAF),
                  ),
                ),
                32.verticalSpace,
                TaskDetailCard(
                  icon: AppIconPath.timer,
                  title: 'Task Create Date :',
                  value: formattedCreate,
                ),
                TaskDetailCard(
                  icon: AppIconPath.timer,
                  title: 'Task Due Time :',
                  value: formattedDue,
                ),
                TaskDetailCard(
                  icon: AppIconPath.tag,
                  title: 'Task Category :',
                  value: task.category.name,
                  color: color,
                  categoryIcon: task.category.icon,
                ),
                TaskDetailCard(
                  icon: AppIconPath.flag,
                  title: 'Task Priority :',
                  value: task.priority.toString(),
                ),
                TaskDetailCard(
                  icon: AppIconPath.trash,
                  title: 'Delete Task',
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TaskDetailCard extends StatelessWidget {
  const TaskDetailCard({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.color,
    this.categoryIcon,
    this.onPressed,
  });
  final String icon;
  final String title;
  final String? value;
  final Color? color;
  final String? categoryIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon),
            8.horizontalSpace,
            Text(title, style: context.typography.body1Regular),
            if (value != null) ...[
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: color ?? context.colors.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      if (categoryIcon != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset(
                            categoryIcon!,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      Text(
                        value.toString(),
                        style: context.typography.body1Regular,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
