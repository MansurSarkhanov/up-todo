import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

import '../bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  List<Widget> get pages => [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
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
          onTap: context.read<MainBloc>().changePage,
        );
      },
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CNButton.icon(
        icon: CNSymbol('pencil.line', size: 16),
        onPressed: () => {},
      ),
      title: Text('Index', style: context.typography.h5Medium),
    );
  }
}
