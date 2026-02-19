import 'package:flutter/material.dart';

interface class AppTypography extends ThemeExtension<AppTypography> {
  AppTypography({
    required this.h1Light,
    required this.h2Light,
    required this.h3Light,
    required this.h4Light,
    required this.h5Light,
    required this.h6Light,
    required this.subtitle1Light,
    required this.subtitle2Light,
    required this.subtitle3Light,
    required this.subtitle4Light,

    required this.body1Light,
    required this.body2Light,
    required this.captionLight,
    required this.overlineLight,
    required this.overlineSmallLight,
    required this.overlineLargeLight,

    required this.h1Regular,
    required this.h2Regular,
    required this.h3Regular,
    required this.h4Regular,
    required this.h5Regular,
    required this.h6Regular,
    required this.subtitle1Regular,
    required this.subtitle2Regular,
    required this.subtitle3Regular,
    required this.subtitle4Regular,

    required this.body1Regular,
    required this.body2Regular,
    required this.captionRegular,
    required this.overlineRegular,
    required this.overlineSmallRegular,
    required this.overlineLargeRegular,

    required this.h1Medium,
    required this.h2Medium,
    required this.h3Medium,
    required this.h4Medium,
    required this.h5Medium,
    required this.h6Medium,
    required this.subtitle1Medium,
    required this.subtitle2Medium,
    required this.subtitle3Medium,
    required this.subtitle4Medium,

    required this.body1Medium,
    required this.body2Medium,
    required this.captionMedium,
    required this.overlineMedium,
    required this.overlineSmallMedium,
    required this.overlineLargeMedium,

    required this.h1SemiBold,
    required this.h2SemiBold,
    required this.h3SemiBold,
    required this.h4SemiBold,
    required this.h5SemiBold,
    required this.h6SemiBold,
    required this.h1Bold,
    required this.h2Bold,
    required this.h3Bold,
    required this.h4Bold,
    required this.h5Bold,
    required this.h6Bold,
    required this.subtitle1SemiBold,
    required this.subtitle2SemiBold,
    required this.subtitle3SemiBold,
    required this.subtitle4SemiBold,

    required this.subtitle1Bold,
    required this.subtitle2Bold,
    required this.subtitle3Bold,
    required this.subtitle4Bold,

    required this.body1SemiBold,
    required this.body2SemiBold,
    required this.captionSemiBold,
    required this.overlineSemiBold,
    required this.overlineSmallSemiBold,
    required this.overlineLargeSemiBold,
  });
  // Light
  final TextStyle h1Light;
  final TextStyle h2Light;
  final TextStyle h3Light;
  final TextStyle h4Light;
  final TextStyle h5Light;
  final TextStyle h6Light;
  final TextStyle subtitle1Light;
  final TextStyle subtitle2Light;
  final TextStyle subtitle3Light;
  final TextStyle subtitle4Light;

  final TextStyle body1Light;
  final TextStyle body2Light;
  final TextStyle captionLight;
  final TextStyle overlineLight;
  final TextStyle overlineSmallLight;
  final TextStyle overlineLargeLight;

  // Regular
  final TextStyle h1Regular;
  final TextStyle h2Regular;
  final TextStyle h3Regular;
  final TextStyle h4Regular;
  final TextStyle h5Regular;
  final TextStyle h6Regular;
  final TextStyle subtitle1Regular;
  final TextStyle subtitle2Regular;
  final TextStyle subtitle3Regular;
  final TextStyle subtitle4Regular;

  final TextStyle body1Regular;
  final TextStyle body2Regular;
  final TextStyle captionRegular;
  final TextStyle overlineRegular;
  final TextStyle overlineSmallRegular;
  final TextStyle overlineLargeRegular;

  // Medium
  final TextStyle h1Medium;
  final TextStyle h2Medium;
  final TextStyle h3Medium;
  final TextStyle h4Medium;
  final TextStyle h5Medium;
  final TextStyle h6Medium;
  final TextStyle subtitle1Medium;
  final TextStyle subtitle2Medium;
  final TextStyle subtitle3Medium;
  final TextStyle subtitle4Medium;

  final TextStyle body1Medium;
  final TextStyle body2Medium;
  final TextStyle captionMedium;
  final TextStyle overlineMedium;
  final TextStyle overlineSmallMedium;
  final TextStyle overlineLargeMedium;

  // SemiBold
  final TextStyle h1SemiBold;
  final TextStyle h2SemiBold;
  final TextStyle h3SemiBold;
  final TextStyle h4SemiBold;
  final TextStyle h5SemiBold;
  final TextStyle h6SemiBold;

  final TextStyle subtitle1SemiBold;
  final TextStyle subtitle2SemiBold;
  final TextStyle subtitle3SemiBold;
  final TextStyle subtitle4SemiBold;
  final TextStyle subtitle1Bold;
  final TextStyle subtitle2Bold;
  final TextStyle subtitle3Bold;
  final TextStyle subtitle4Bold;

  final TextStyle body1SemiBold;
  final TextStyle body2SemiBold;
  final TextStyle captionSemiBold;
  final TextStyle overlineSemiBold;
  final TextStyle overlineSmallSemiBold;
  final TextStyle overlineLargeSemiBold;

  // Bold
  final TextStyle h1Bold;
  final TextStyle h2Bold;
  final TextStyle h3Bold;
  final TextStyle h4Bold;
  final TextStyle h5Bold;
  final TextStyle h6Bold;

  @override
  ThemeExtension<AppTypography> copyWith({
    final TextStyle? h1Light,
    final TextStyle? h2Light,
    final TextStyle? h3Light,
    final TextStyle? h4Light,
    final TextStyle? h5Light,
    final TextStyle? h6Light,
    final TextStyle? subtitle1Light,
    final TextStyle? subtitle2Light,
    final TextStyle? subtitle3Light,
    final TextStyle? subtitle4Light,

    final TextStyle? body1Light,
    final TextStyle? body2Light,
    final TextStyle? captionLight,
    final TextStyle? overlineLight,
    final TextStyle? overlineSmallLight,
    final TextStyle? overlineLargeLight,

    final TextStyle? h1Regular,
    final TextStyle? h2Regular,
    final TextStyle? h3Regular,
    final TextStyle? h4Regular,
    final TextStyle? h5Regular,
    final TextStyle? h6Regular,
    final TextStyle? subtitle1Regular,
    final TextStyle? subtitle2Regular,
    final TextStyle? subtitle3Regular,
    final TextStyle? subtitle4Regular,

    final TextStyle? body1Regular,
    final TextStyle? body2Regular,
    final TextStyle? captionRegular,
    final TextStyle? overlineRegular,
    final TextStyle? overlineSmallRegular,
    final TextStyle? overlineLargeRegular,

    final TextStyle? h1Medium,
    final TextStyle? h2Medium,
    final TextStyle? h3Medium,
    final TextStyle? h4Medium,
    final TextStyle? h5Medium,
    final TextStyle? h6Medium,
    final TextStyle? subtitle1Medium,
    final TextStyle? subtitle2Medium,
    final TextStyle? subtitle3Medium,
    final TextStyle? subtitle4Medium,

    final TextStyle? body1Medium,
    final TextStyle? body2Medium,
    final TextStyle? captionMedium,
    final TextStyle? overlineMedium,
    final TextStyle? overlineSmallMedium,
    final TextStyle? overlineLargeMedium,

    final TextStyle? h1SemiBold,
    final TextStyle? h2SemiBold,
    final TextStyle? h3SemiBold,
    final TextStyle? h4SemiBold,
    final TextStyle? h5SemiBold,
    final TextStyle? h6SemiBold,
    final TextStyle? subtitle1SemiBold,
    final TextStyle? subtitle2SemiBold,
    final TextStyle? subtitle3SemiBold,
    final TextStyle? subtitle4SemiBold,
    final TextStyle? subtitle1Bold,
    final TextStyle? subtitle2Bold,
    final TextStyle? subtitle3Bold,
    final TextStyle? subtitle4Bold,

    final TextStyle? body1SemiBold,
    final TextStyle? body2SemiBold,
    final TextStyle? captionSemiBold,
    final TextStyle? overlineSemiBold,
    final TextStyle? overlineSmallSemiBold,
    final TextStyle? overlineLargeSemiBold,

    final TextStyle? h1Bold,
    final TextStyle? h2Bold,
    final TextStyle? h3Bold,
    final TextStyle? h4Bold,
    final TextStyle? h5Bold,
    final TextStyle? h6Bold,
  }) {
    return AppTypography(
      h1Light: h1Light ?? this.h1Light,
      h2Light: h2Light ?? this.h2Light,
      h3Light: h3Light ?? this.h3Light,
      h4Light: h4Light ?? this.h4Light,
      h5Light: h5Light ?? this.h5Light,
      h6Light: h6Light ?? this.h6Light,
      subtitle1Light: subtitle1Light ?? this.subtitle1Light,
      subtitle2Light: subtitle2Light ?? this.subtitle2Light,
      subtitle3Light: subtitle3Light ?? this.subtitle3Light,
      subtitle4Light: subtitle4Light ?? this.subtitle4Light,
      body1Light: body1Light ?? this.body1Light,
      body2Light: body2Light ?? this.body2Light,
      captionLight: captionLight ?? this.captionLight,
      overlineLight: overlineLight ?? this.overlineLight,
      overlineSmallLight: overlineSmallLight ?? this.overlineSmallLight,
      overlineLargeLight: overlineLargeLight ?? this.overlineLargeLight,
      h1Regular: h1Regular ?? this.h1Regular,
      h2Regular: h2Regular ?? this.h2Regular,
      h3Regular: h3Regular ?? this.h3Regular,
      h4Regular: h4Regular ?? this.h4Regular,
      h5Regular: h5Regular ?? this.h5Regular,
      h6Regular: h6Regular ?? this.h6Regular,
      subtitle1Regular: subtitle1Regular ?? this.subtitle1Regular,
      subtitle2Regular: subtitle2Regular ?? this.subtitle2Regular,
      subtitle3Regular: subtitle3Regular ?? this.subtitle3Regular,
      subtitle4Regular: subtitle4Regular ?? this.subtitle4Regular,
      body1Regular: body1Regular ?? this.body1Regular,
      body2Regular: body2Regular ?? this.body2Regular,
      captionRegular: captionRegular ?? this.captionRegular,
      overlineRegular: overlineRegular ?? this.overlineRegular,
      overlineSmallRegular: overlineSmallRegular ?? this.overlineSmallRegular,
      overlineLargeRegular: overlineLargeRegular ?? this.overlineLargeRegular,
      h1Medium: h1Medium ?? this.h1Medium,
      h2Medium: h2Medium ?? this.h2Medium,
      h3Medium: h3Medium ?? this.h3Medium,
      h4Medium: h4Medium ?? this.h4Medium,
      h5Medium: h5Medium ?? this.h5Medium,
      h6Medium: h6Medium ?? this.h6Medium,
      subtitle1Medium: subtitle1Medium ?? this.subtitle1Medium,
      subtitle2Medium: subtitle2Medium ?? this.subtitle2Medium,
      subtitle3Medium: subtitle3Medium ?? this.subtitle3Medium,
      subtitle4Medium: subtitle4Medium ?? this.subtitle4Medium,
      body1Medium: body1Medium ?? this.body1Medium,
      body2Medium: body2Medium ?? this.body2Medium,
      captionMedium: captionMedium ?? this.captionMedium,
      overlineMedium: overlineMedium ?? this.overlineMedium,
      overlineSmallMedium: overlineSmallMedium ?? this.overlineSmallMedium,
      overlineLargeMedium: overlineLargeMedium ?? this.overlineLargeMedium,
      h1SemiBold: h1SemiBold ?? this.h1SemiBold,
      h2SemiBold: h2SemiBold ?? this.h2SemiBold,
      h3SemiBold: h3SemiBold ?? this.h3SemiBold,
      h4SemiBold: h4SemiBold ?? this.h4SemiBold,
      h5SemiBold: h5SemiBold ?? this.h5SemiBold,
      h6SemiBold: h6SemiBold ?? this.h6SemiBold,
      subtitle1SemiBold: subtitle1SemiBold ?? this.subtitle1SemiBold,
      subtitle2SemiBold: subtitle2SemiBold ?? this.subtitle2SemiBold,
      subtitle3SemiBold: subtitle3SemiBold ?? this.subtitle3SemiBold,
      subtitle4SemiBold: subtitle4SemiBold ?? this.subtitle4SemiBold,
      body1SemiBold: body1SemiBold ?? this.body1SemiBold,
      body2SemiBold: body2SemiBold ?? this.body2SemiBold,
      captionSemiBold: captionSemiBold ?? this.captionSemiBold,
      overlineSemiBold: overlineSemiBold ?? this.overlineSemiBold,
      overlineSmallSemiBold:
          overlineSmallSemiBold ?? this.overlineSmallSemiBold,
      overlineLargeSemiBold:
          overlineLargeSemiBold ?? this.overlineLargeSemiBold,
      h1Bold: h1Bold ?? this.h1Bold,
      h2Bold: h2Bold ?? this.h2Bold,
      h3Bold: h3Bold ?? this.h3Bold,
      h4Bold: h4Bold ?? this.h4Bold,
      h5Bold: h5Bold ?? this.h5Bold,
      h6Bold: h6Bold ?? this.h6Bold,
      subtitle1Bold: subtitle1Bold ?? this.subtitle1Bold,
      subtitle2Bold: subtitle2Bold ?? this.subtitle2Bold,
      subtitle3Bold: subtitle3Bold ?? this.subtitle3Bold,
      subtitle4Bold: subtitle4Bold ?? this.subtitle4Bold,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      h1Light: TextStyle.lerp(h1Light, other.h1Light, t)!,
      h2Light: TextStyle.lerp(h2Light, other.h2Light, t)!,
      h3Light: TextStyle.lerp(h3Light, other.h3Light, t)!,
      h4Light: TextStyle.lerp(h4Light, other.h4Light, t)!,
      h5Light: TextStyle.lerp(h5Light, other.h5Light, t)!,
      h6Light: TextStyle.lerp(h6Light, other.h6Light, t)!,
      subtitle1Light: TextStyle.lerp(subtitle1Light, other.subtitle1Light, t)!,
      subtitle2Light: TextStyle.lerp(subtitle2Light, other.subtitle2Light, t)!,
      subtitle3Light: TextStyle.lerp(subtitle3Light, other.subtitle3Light, t)!,
      subtitle4Light: TextStyle.lerp(subtitle4Light, other.subtitle4Light, t)!,
      body1Light: TextStyle.lerp(body1Light, other.body1Light, t)!,
      body2Light: TextStyle.lerp(body2Light, other.body2Light, t)!,
      captionLight: TextStyle.lerp(captionLight, other.captionLight, t)!,
      overlineLight: TextStyle.lerp(overlineLight, other.overlineLight, t)!,
      overlineSmallLight: TextStyle.lerp(
        overlineSmallLight,
        other.overlineSmallLight,
        t,
      )!,
      overlineLargeLight: TextStyle.lerp(
        overlineLargeLight,
        other.overlineLargeLight,
        t,
      )!,
      h1Regular: TextStyle.lerp(h1Regular, other.h1Regular, t)!,
      h2Regular: TextStyle.lerp(h2Regular, other.h2Regular, t)!,
      h3Regular: TextStyle.lerp(h3Regular, other.h3Regular, t)!,
      h4Regular: TextStyle.lerp(h4Regular, other.h4Regular, t)!,
      h5Regular: TextStyle.lerp(h5Regular, other.h5Regular, t)!,
      h6Regular: TextStyle.lerp(h6Regular, other.h6Regular, t)!,
      subtitle1Regular: TextStyle.lerp(
        subtitle1Regular,
        other.subtitle1Regular,
        t,
      )!,
      subtitle2Regular: TextStyle.lerp(
        subtitle2Regular,
        other.subtitle2Regular,
        t,
      )!,
      subtitle3Regular: TextStyle.lerp(
        subtitle3Regular,
        other.subtitle3Regular,
        t,
      )!,
      subtitle4Regular: TextStyle.lerp(
        subtitle4Regular,
        other.subtitle4Regular,
        t,
      )!,
      body1Regular: TextStyle.lerp(body1Regular, other.body1Regular, t)!,
      body2Regular: TextStyle.lerp(body2Regular, other.body2Regular, t)!,
      captionRegular: TextStyle.lerp(captionRegular, other.captionRegular, t)!,
      overlineRegular: TextStyle.lerp(
        overlineRegular,
        other.overlineRegular,
        t,
      )!,
      overlineSmallRegular: TextStyle.lerp(
        overlineSmallRegular,
        other.overlineSmallRegular,
        t,
      )!,
      overlineLargeRegular: TextStyle.lerp(
        overlineLargeRegular,
        other.overlineLargeRegular,
        t,
      )!,
      h1Medium: TextStyle.lerp(h1Medium, other.h1Medium, t)!,
      h2Medium: TextStyle.lerp(h2Medium, other.h2Medium, t)!,
      h3Medium: TextStyle.lerp(h3Medium, other.h3Medium, t)!,
      h4Medium: TextStyle.lerp(h4Medium, other.h4Medium, t)!,
      h5Medium: TextStyle.lerp(h5Medium, other.h5Medium, t)!,
      h6Medium: TextStyle.lerp(h6Medium, other.h6Medium, t)!,
      subtitle1Medium: TextStyle.lerp(
        subtitle1Medium,
        other.subtitle1Medium,
        t,
      )!,
      subtitle2Medium: TextStyle.lerp(
        subtitle2Medium,
        other.subtitle2Medium,
        t,
      )!,
      subtitle3Medium: TextStyle.lerp(
        subtitle3Medium,
        other.subtitle3Medium,
        t,
      )!,
      subtitle4Medium: TextStyle.lerp(
        subtitle4Medium,
        other.subtitle4Medium,
        t,
      )!,
      body1Medium: TextStyle.lerp(body1Medium, other.body1Medium, t)!,
      body2Medium: TextStyle.lerp(body2Medium, other.body2Medium, t)!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
      overlineMedium: TextStyle.lerp(overlineMedium, other.overlineMedium, t)!,
      overlineSmallMedium: TextStyle.lerp(
        overlineSmallMedium,
        other.overlineSmallMedium,
        t,
      )!,
      overlineLargeMedium: TextStyle.lerp(
        overlineLargeMedium,
        other.overlineLargeMedium,
        t,
      )!,
      h1SemiBold: TextStyle.lerp(h1SemiBold, other.h1SemiBold, t)!,
      h2SemiBold: TextStyle.lerp(h2SemiBold, other.h2SemiBold, t)!,
      h3SemiBold: TextStyle.lerp(h3SemiBold, other.h3SemiBold, t)!,
      h4SemiBold: TextStyle.lerp(h4SemiBold, other.h4SemiBold, t)!,
      h5SemiBold: TextStyle.lerp(h5SemiBold, other.h5SemiBold, t)!,
      h6SemiBold: TextStyle.lerp(h6SemiBold, other.h6SemiBold, t)!,
      subtitle1SemiBold: TextStyle.lerp(
        subtitle1SemiBold,
        other.subtitle1SemiBold,
        t,
      )!,
      subtitle2SemiBold: TextStyle.lerp(
        subtitle2SemiBold,
        other.subtitle2SemiBold,
        t,
      )!,
      subtitle3SemiBold: TextStyle.lerp(
        subtitle3SemiBold,
        other.subtitle3SemiBold,
        t,
      )!,
      subtitle4SemiBold: TextStyle.lerp(
        subtitle4SemiBold,
        other.subtitle4SemiBold,
        t,
      )!,
      body1SemiBold: TextStyle.lerp(body1SemiBold, other.body1SemiBold, t)!,
      body2SemiBold: TextStyle.lerp(body2SemiBold, other.body2SemiBold, t)!,
      captionSemiBold: TextStyle.lerp(
        captionSemiBold,
        other.captionSemiBold,
        t,
      )!,
      overlineSemiBold: TextStyle.lerp(
        overlineSemiBold,
        other.overlineSemiBold,
        t,
      )!,
      overlineSmallSemiBold: TextStyle.lerp(
        overlineSmallSemiBold,
        other.overlineSmallSemiBold,
        t,
      )!,
      overlineLargeSemiBold: TextStyle.lerp(
        overlineLargeSemiBold,
        other.overlineLargeSemiBold,
        t,
      )!,
      h1Bold: TextStyle.lerp(h1Bold, other.h1Bold, t)!,
      h2Bold: TextStyle.lerp(h2Bold, other.h2Bold, t)!,
      h3Bold: TextStyle.lerp(h3Bold, other.h3Bold, t)!,
      h4Bold: TextStyle.lerp(h4Bold, other.h4Bold, t)!,
      h5Bold: TextStyle.lerp(h5Bold, other.h5Bold, t)!,
      h6Bold: TextStyle.lerp(h6Bold, other.h6Bold, t)!,
      subtitle1Bold: TextStyle.lerp(subtitle1Bold, other.subtitle1Bold, t)!,
      subtitle2Bold: TextStyle.lerp(subtitle2Bold, other.subtitle2Bold, t)!,
      subtitle3Bold: TextStyle.lerp(subtitle3Bold, other.subtitle3Bold, t)!,
      subtitle4Bold: TextStyle.lerp(subtitle4Bold, other.subtitle4Bold, t)!,
    );
  }
}
