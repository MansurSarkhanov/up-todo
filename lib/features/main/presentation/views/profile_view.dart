import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/features/auth/presentation/bloc/auth_event.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_appbar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../widgets/profile_tile.dart';
import '../widgets/task_overview.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.colors.backgroundColor,
      body: _body(context),
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            height: 85,
            width: 85,
          ),
          8.verticalSpace,
          Text('Martha Hays', style: context.typography.h6Regular),
          16.verticalSpace,
          TaskOverview(leftTaskCount: 10, doneTaskCount: 5),
          32.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Setting', style: context.typography.subtitle3Regular),
              4.verticalSpace,
              ProfileTile(
                icon: AppIconPath.setting,
                title: 'App Settings',
                onTap: () => context.push(Routes.setting),
              ),
              14.verticalSpace,
              Text('Account', style: context.typography.subtitle3Regular),
              4.verticalSpace,
              ProfileTile(
                icon: AppIconPath.user,
                title: 'Change account name',
                onTap: () {},
              ),
              ProfileTile(
                icon: AppIconPath.key,
                title: 'Change account password',
                onTap: () {},
              ),
              ProfileTile(
                icon: AppIconPath.camera,
                title: 'Change account Image',
                onTap: () {},
              ),
              ProfileTile(
                icon: AppIconPath.logout,
                title: 'Log out',
                onTap: () =>
                    context.read<AuthBloc>().add(AuthLogoutRequested()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: SizedBox.shrink(),
      title: Text('Profile', style: context.typography.h5Medium),
    );
  }
}
