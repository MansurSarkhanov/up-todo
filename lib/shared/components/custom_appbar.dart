import 'dart:io';

import 'package:cupertino_native_better/cupertino_native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/icons.dart';
import '../animations/animated_button_effect.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.toolbarHeight,
    this.leadingWidth,
    this.flexibleSpace,
    this.defaultLeadingColor,
    this.defaultLeadingBorderColor,
    this.overlayStyle = SystemUiOverlayStyle.light,
  });
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double? toolbarHeight;
  final double? leadingWidth;
  final Widget? flexibleSpace;
  final Color? defaultLeadingColor;
  final Color? defaultLeadingBorderColor;
  final SystemUiOverlayStyle? overlayStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
      systemOverlayStyle: overlayStyle,
      leadingWidth: leadingWidth ?? 74,
      flexibleSpace: flexibleSpace,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Platform.isIOS
            ? leading ??
                  CNButton.icon(
                    icon: CNSymbol('chevron.backward', size: 16),
                    onPressed: () => context.pop(),
                  )
            : Align(
                alignment: Alignment.centerLeft,
                child: AnimationButtonEffect(
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child:
                        leading ??
                        SvgPicture.asset(
                          AppIconPath.arrowLeft,
                          colorFilter: ColorFilter.mode(
                            defaultLeadingColor ?? Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                  ),
                ),
              ),
      ),
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 56.h);
}
