import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/utils/extensions/context_extension.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: context.typography.body1Regular),
      trailing: SvgPicture.asset(AppIconPath.arrowRight),
    );
  }
}
