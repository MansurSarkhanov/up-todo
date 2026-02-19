import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/extensions/context_extension.dart';
import '../animations/animated_button_effect.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.borderColor,
    this.width,
    this.onTap,
    this.color,
    this.textColor,
    this.child,
    this.borderRadius,
    this.height,
    this.clickColor,
    this.padding,
    this.borderWidth,
    this.isLoading,
    this.isActive,
    this.loadingColor,
    this.fontSize,
  });
  final Widget? child;
  final double? width;
  final double? borderWidth;
  final double? height;
  final Color? clickColor;
  final Color? loadingColor;
  final String? text;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Color? color, textColor;
  final Color? borderColor;
  final void Function()? onTap;
  final bool? isLoading;
  final bool? isActive;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return AnimationButtonEffect(
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(padding),
          shadowColor: WidgetStatePropertyAll(Colors.transparent),
          maximumSize: WidgetStatePropertyAll(
            Size(width ?? MediaQuery.sizeOf(context).width, height ?? 52.h),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.pressed)) {
              return (isActive ?? true)
                  ? (clickColor ?? context.colors.primary)
                  : context.colors.primary50;
            }
            return (isActive ?? true)
                ? (color ?? context.colors.primary)
                : context.colors.primary50;
          }),
        ),
        onPressed: (isActive ?? true) ? onTap : () {},
        child: isLoading ?? false
            ? Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(
                        radius: 10.r,
                        color: loadingColor ?? Colors.white,
                      )
                    : CircularProgressIndicator(
                        color: loadingColor ?? Colors.white,
                        strokeWidth: 2,
                      ),
              )
            : child ??
                  Center(
                    child: Text(
                      text.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize ?? 16.sp,
                        color: isActive ?? true
                            ? (textColor ?? Colors.white)
                            : Colors.white,
                      ),
                    ),
                  ),
      ),
    );
  }
}
