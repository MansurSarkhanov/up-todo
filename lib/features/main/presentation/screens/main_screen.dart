import 'dart:io';

import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_todo/core/helpers/app_helper.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/features/focus/presentation/screens/focus_view.dart';
import 'package:up_todo/features/user/presentation/screens/profile_view.dart';

import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../../tasks/presentation/screens/home_view.dart';
import '../bloc/main_bloc.dart';
import '../views/calendar_view.dart';
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
      extendBody: true,
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
        if (Platform.isIOS) {
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
                  child: BlocProvider.value(
                    value: context.read<TaskBloc>(),
                    child: AddNewTaskSheet(),
                  ),
                );
              } else {
                context.read<MainBloc>().changePage(index);
              }
            },
          );
        } else {
          return AndroidBottomBar(
            currentIndex: state,
            onTap: (index) {
              if (index == 2) {
                AppHelper.showBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  child: BlocProvider.value(
                    value: context.read<TaskBloc>(),
                    child: AddNewTaskSheet(),
                  ),
                );
              } else {
                context.read<MainBloc>().changePage(index);
              }
            },
          );
        }
      },
    );
  }
}

class AndroidBottomBar extends StatefulWidget {
  const AndroidBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;

  @override
  State<AndroidBottomBar> createState() => _AndroidBottomBarState();
}

class _AndroidBottomBarState extends State<AndroidBottomBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.currentIndex,
      backgroundColor: context.colors.secondary,
      labelTextStyle: WidgetStatePropertyAll(
        context.typography.subtitle4Medium,
      ),
      indicatorColor: context.colors.primary,
      onDestinationSelected: widget.onTap,
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/home_fill.svg'),
          label: 'Home',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/calendar.svg'),
          label: 'Calendar',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/add.svg'),
          label: 'Add',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/clock.svg'),
          label: 'Focus',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/user.svg'),
          label: 'Profile',
        ),
      ],
    );
  }
}
