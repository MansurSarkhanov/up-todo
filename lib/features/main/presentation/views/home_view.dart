import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';

import '../../../../shared/components/custom_appbar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../../tasks/presentation/bloc/task_event.dart';
import '../../../tasks/presentation/bloc/task_state.dart';
import '../widgets/empty_task.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthBloc>().state.user!.uid;

    // Firestore stream-i başlatmaq
    context.read<TaskBloc>().add(LoadTasks(userId));
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
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (val) {
                          // ToggleTaskRequested event-i buradan göndərə bilərsən
                        },
                      ),
                    ),
                  );
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
