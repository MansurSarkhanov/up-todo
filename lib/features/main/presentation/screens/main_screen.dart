import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CNButton.icon(
          icon: CNSymbol('pencil.line', size: 16),
          onPressed: () => {},
        ),
        title: Text('Index', style: context.typography.h5Medium),
      ),
      backgroundColor: context.colors.backgroundColor,
      bottomNavigationBar: CNTabBar(
        iconSize: 18,
        tint: context.colors.primary,
        items: [
          CNTabBarItem(label: 'Home', icon: CNSymbol("house")),
          CNTabBarItem(
            label: 'Calendar',
            icon: CNSymbol("calendar.badge.checkmark"),
          ),
          CNTabBarItem(label: 'Add', icon: CNSymbol("plus.circle")),
          CNTabBarItem(label: 'Focus', icon: CNSymbol("clock")),
          CNTabBarItem(label: 'Profile', icon: CNSymbol("person.crop.circle")),
        ],
        currentIndex: 1,
        onTap: (index) {},
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(AuthLogoutRequested());
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
