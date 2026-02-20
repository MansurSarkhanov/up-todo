import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_button.dart';

class SosialButton extends StatelessWidget {
  const SosialButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconPath,
  });
  final VoidCallback onTap;
  final String text;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      color: Colors.transparent,
      borderColor: context.colors.primary,
      clickColor: context.colors.primary.withValues(alpha: 0.1),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            12.horizontalSpace,
            Text(text, style: context.typography.body2Regular),
          ],
        ),
      ),
    );
  }
}
