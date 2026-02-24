import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/features/auth/presentation/bloc/auth_event.dart';
import 'package:up_todo/features/main/presentation/widgets/user_update_dialog.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_appbar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../main/presentation/widgets/task_overview.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';
import '../widgets/profile_image.dart';
import '../widgets/profile_tile.dart';

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
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserError) {
            return Center(child: Text(state.message));
          }
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileImage(photoUrl: state.user.photoUrl),
                8.verticalSpace,
                if (state.user.username != null)
                  Text(
                    state.user.username!,
                    style: context.typography.h6Regular,
                  ),
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFF00D4FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn,
                  child: Text(
                    state.user.email,
                    style: context.typography.subtitle2Regular.copyWith(
                      color: Colors.white, // vacibdir
                    ),
                  ),
                ),
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
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: context.read<UserBloc>(),
                            child: UserUpdateDialog(
                              title: state.user.username ?? '',
                            ),
                          ),
                        );
                      },
                    ),
                    ProfileTile(
                      icon: AppIconPath.key,
                      title: 'Change account password',
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
            );
          }
          return SizedBox.shrink();
        },
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
