import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/helpers/app_helper.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/features/main/presentation/views/focus_view.dart';
import 'package:up_todo/features/main/presentation/views/profile_view.dart';

import '../bloc/main_bloc.dart';
import '../views/calendar_view.dart';
import '../views/home_view.dart';
import '../widgets/add_new_task_sheet.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  List<Widget> get pages => [
    HomeView(),
    CalendarView(),
    SizedBox.shrink(),
    FocusView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      bottomNavigationBar: _bottomBar(context),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<MainBloc, int>(
      builder: (context, state) {
        return IndexedStack(index: state, children: pages);
      },
    );
  }

  Widget _bottomBar(BuildContext context) {
    return BlocBuilder<MainBloc, int>(
      builder: (context, state) {
        return CNTabBar(
          iconSize: 18,
          tint: context.colors.primary,
          items: [
            CNTabBarItem(label: 'Home', icon: CNSymbol("house")),
            CNTabBarItem(label: 'Calendar', icon: CNSymbol("calendar")),
            CNTabBarItem(label: 'Add', icon: CNSymbol("plus.circle")),
            CNTabBarItem(label: 'Focus', icon: CNSymbol("clock")),
            CNTabBarItem(
              label: 'Profile',
              icon: CNSymbol("person.crop.circle"),
            ),
          ],
          currentIndex: state,
          onTap: (index) {
            if (index == 2) {
              AppHelper.showBottomSheet(
                isScrollControlled: true,
                context: context,
                child: AddNewTaskSheet(),
              );
            } else {
              context.read<MainBloc>().changePage(index);
            }
          },
        );
      },
    );
  }
}
