import 'package:flutter/material.dart';

interface class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.primary,
    required this.primary50,
    required this.textPrimary,
    required this.neutralTitle,
    required this.neutralSecondaryText,
    required this.neutralPrimaryText,
    required this.neutralDivider,
    required this.textFieldBackColor,
    required this.backgroundColor,
    required this.transparentColor,
    required this.whiteColor,
    required this.blackColor,
    required this.black54Color,
    required this.black38Color,
    required this.black87Color,

    required this.neutralDisable,
    required this.neutralBackground,
    required this.neutralBorder,
    required this.errorNormal,
    required this.errorLight,
    required this.successNormal,
    required this.neutralTableHeader,
    required this.strokeColor,
    required this.hintTextColor,
  });

  //primary colors
  final Color primary;
  final Color primary50;
  final Color textPrimary;
  final Color strokeColor;

  final Color neutralTitle;
  final Color neutralSecondaryText;
  final Color neutralPrimaryText;
  final Color neutralDisable;
  final Color neutralBackground;
  final Color neutralDivider;
  final Color neutralBorder;
  final Color neutralTableHeader;

  //Error Colors
  final Color errorNormal;
  final Color errorLight;

  //Success Colors
  final Color successNormal;

  final Color backgroundColor;
  final Color textFieldBackColor;
  final Color hintTextColor;
  final Color transparentColor;
  final Color whiteColor;
  final Color blackColor;
  final Color black87Color;
  final Color black54Color;
  final Color black38Color;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? primary50,
    Color? textPrimary,
    Color? strokeColor,
    Color? hintTextColor,
    Color? neutralTitle,
    Color? neutralSecondaryText,
    Color? neutralDisable,
    Color? neutralPrimaryText,
    Color? neutralBackground,
    Color? neutralDivider,
    Color? neutralBorder,
    Color? neutralTableHeader,
    Color? errorNormal,
    Color? errorLight,
    Color? successNormal,
    Color? textFieldBackColor,
    Color? backgroundColor,
    Color? transparentColor,
    Color? boxInsideColor,
    Color? fieldUnactiveColor,
    Color? whiteColor,
    Color? blackColor,
    Color? black54Color,
    Color? black38Color,
    Color? pinUnFilledColor,
    Color? cardBorderColor,
    Color? black87Color,
    Color? bottomBorderColor,
    Color? dividerColor,
    Color? shadowColor,
    Color? buttonClickColor,
    Color? inputBackgroundColor,
    Color? orangeColor,
  }) {
    return AppColors(
      textFieldBackColor: textFieldBackColor ?? this.textFieldBackColor,
      primary: primary ?? this.primary,
      primary50: primary50 ?? this.primary50,
      textPrimary: textPrimary ?? this.textPrimary,
      strokeColor: strokeColor ?? this.strokeColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      neutralTitle: neutralTitle ?? this.neutralTitle,
      neutralSecondaryText: neutralSecondaryText ?? this.neutralSecondaryText,
      neutralPrimaryText: neutralPrimaryText ?? this.neutralPrimaryText,
      neutralDisable: neutralDisable ?? this.neutralDisable,
      neutralBackground: neutralBackground ?? this.neutralBackground,
      neutralDivider: neutralDivider ?? this.neutralDivider,
      neutralBorder: neutralBorder ?? this.neutralBorder,
      neutralTableHeader: neutralTableHeader ?? this.neutralTableHeader,
      errorNormal: errorNormal ?? this.errorNormal,
      errorLight: errorLight ?? this.errorLight,
      successNormal: successNormal ?? this.successNormal,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      transparentColor: transparentColor ?? this.transparentColor,
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
      black87Color: black87Color ?? this.black87Color,
      black54Color: black54Color ?? this.black54Color,
      black38Color: black38Color ?? this.black38Color,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;
    return AppColors(
      textFieldBackColor: Color.lerp(
        textFieldBackColor,
        other.textFieldBackColor,
        t,
      )!,
      hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t)!,
      strokeColor: Color.lerp(strokeColor, other.strokeColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primary50: Color.lerp(primary50, other.primary50, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      neutralTitle: Color.lerp(neutralTitle, other.neutralTitle, t)!,
      neutralSecondaryText: Color.lerp(
        neutralSecondaryText,
        other.neutralSecondaryText,
        t,
      )!,
      neutralPrimaryText: Color.lerp(
        neutralPrimaryText,
        other.neutralPrimaryText,
        t,
      )!,
      neutralDisable: Color.lerp(neutralDisable, other.neutralDisable, t)!,
      neutralBackground: Color.lerp(
        neutralBackground,
        other.neutralBackground,
        t,
      )!,
      neutralDivider: Color.lerp(neutralDivider, other.neutralDivider, t)!,
      neutralBorder: Color.lerp(neutralBorder, other.neutralBorder, t)!,
      neutralTableHeader: Color.lerp(
        neutralTableHeader,
        other.neutralTableHeader,
        t,
      )!,
      errorNormal: Color.lerp(errorNormal, other.errorNormal, t)!,
      errorLight: Color.lerp(errorLight, other.errorLight, t)!,
      successNormal: Color.lerp(successNormal, other.successNormal, t)!,
      transparentColor: Color.lerp(
        transparentColor,
        other.transparentColor,
        t,
      )!,

      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      blackColor: Color.lerp(blackColor, other.blackColor, t)!,
      black87Color: Color.lerp(black87Color, other.black87Color, t)!,
      black54Color: Color.lerp(black54Color, other.black54Color, t)!,
      black38Color: Color.lerp(black38Color, other.black38Color, t)!,
    );
  }
}

@protected
class AppLightColors extends AppColors {
  AppLightColors({
    super.textFieldBackColor = const Color(0xFF1D1D1D),
    super.hintTextColor = const Color(0xFF535353),
    super.primary = const Color(0xFF8875FF),
    super.primary50 = const Color(0xFF8875FF),
    super.textPrimary = const Color(0xDEFFFFFF),
    super.strokeColor = const Color(0xFF979797),
    super.neutralTitle = const Color(0xFFFFFFFF),
    super.neutralSecondaryText = const Color(0xFF8C8C8C),
    super.neutralPrimaryText = const Color(0xFF595959),
    super.neutralDisable = const Color(0xFFBFBFBF),
    super.neutralBackground = const Color(0xFFF5F5F5),
    super.neutralDivider = const Color(0xFFF0F0F0),
    super.neutralBorder = const Color(0xFFD9D9D9),
    super.neutralTableHeader = const Color(0xFFFAFAFA),
    super.errorNormal = const Color(0xFFDE1135),
    super.errorLight = const Color(0xFFFDECEC),
    super.successNormal = const Color(0xFF0E8345),
    super.backgroundColor = const Color(0xFF121212),
    super.transparentColor = const Color(0x00000000),
    super.whiteColor = const Color(0xFFFFFFFF),
    super.blackColor = const Color(0xFF000000),
    super.black87Color = const Color(0xDE000000),
    super.black54Color = const Color.fromRGBO(0, 0, 0, 0.541),
    super.black38Color = const Color(0x61000000),
  });
}
