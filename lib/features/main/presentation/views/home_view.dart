import 'package:cupertino_native_better/cupertino_native_better.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/constants/images.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';

import '../../../../shared/components/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),

      backgroundColor: context.colors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
