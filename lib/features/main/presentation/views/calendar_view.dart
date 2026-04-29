import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.colors.backgroundColor,
      body: const Center(child: Text('Calendar')),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: const SizedBox.shrink(),
      title: Text('Calendar', style: context.typography.h5Medium),
    );
  }
}
