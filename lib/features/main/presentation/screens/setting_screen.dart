import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/features/main/presentation/widgets/profile_tile.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';

import '../../../../core/utils/extensions/context_extension.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Settings', style: context.typography.subtitle3Regular),
          4.verticalSpace,
          ProfileTile(
            title: 'Change app color',
            onTap: () {},
            icon: AppIconPath.brush,
          ),
          ProfileTile(
            title: 'Change app language',
            onTap: () {},
            icon: AppIconPath.language,
          ),
        ],
      ),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      title: Text('Setting', style: context.typography.h5Medium),
    );
  }
}
