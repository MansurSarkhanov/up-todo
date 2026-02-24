import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/core/routes/routes.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/features/tasks/data/models/task_model.dart';

import '../../../../core/models/category_model.dart';
import '../../../../shared/components/custom_appbar.dart';
import '../../../../shared/dialogs/category_dialog.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_state.dart';
import '../widgets/empty_task.dart';

part '../widgets/task_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.colors.backgroundColor,
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          switch (state.status) {
            case TaskStatus.initial:
            case TaskStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TaskStatus.success:
              final tasks = state.tasks;
              if (tasks.isEmpty) {
                return const EmptyTask();
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskTile(task: task);
                },
              );
            case TaskStatus.failure:
              return Center(child: Text(state.error ?? 'Something went wrong'));
          }
        },
      ),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CNButton.icon(
        icon: CNSymbol('line.3.horizontal.decrease', size: 16),
        onPressed: () => {},
      ),
      title: Text('Index', style: context.typography.h5Medium),
    );
  }
}
