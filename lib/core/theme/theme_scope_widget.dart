import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/dimensions.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'theme_scope.dart';

class ThemeScopeWidget extends StatefulWidget {
  const ThemeScopeWidget({super.key, required this.child});

  final Widget child;
  static ThemeScopeWidgetState? of(BuildContext context) {
    return context.findRootAncestorStateOfType<ThemeScopeWidgetState>();
  }

  @override
  State<ThemeScopeWidget> createState() => ThemeScopeWidgetState();
}

class ThemeScopeWidgetState extends State<ThemeScopeWidget> {
  String get appFont => 'Lato';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final appColors = AppLightColors();
    final appTypography = AppTypography(
      h1Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      h2Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      h3Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      h4Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      h5Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      h6Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      h1Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      h2Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      h3Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      h4Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      h5Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      h6Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      h1Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      h2Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      h3Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      h4Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      h5Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      h6Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      h1SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      h2SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      h3SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      h4SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      h5SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      h6SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      h1Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      h2Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      h3Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      h4Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      h5Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w700,
        color: appColors.black87Color,
      ),
      h6Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      body1Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      body2Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      body1Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      body2Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      body1Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      body2Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      body1SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      body2SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      captionLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      captionRegular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      captionMedium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      captionSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      overlineLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      overlineRegular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      overlineMedium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      overlineSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      overlineSmallLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      overlineSmallRegular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      overlineSmallMedium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      overlineSmallSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      overlineLargeLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineLarge,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      overlineLargeRegular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineLarge,
        fontWeight: FontWeight.w400,
        color: appColors.black87Color,
      ),
      overlineLargeMedium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineLarge,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      overlineLargeSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineLarge,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      subtitle1Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      subtitle1Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      subtitle1Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      subtitle1SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      subtitle1Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      subtitle2Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      subtitle2Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      subtitle2Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      subtitle2SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      subtitle2Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      subtitle3Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      subtitle3Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      subtitle3Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      subtitle3SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      subtitle3Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
      subtitle4Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w300,
        color: appColors.textPrimary,
      ),
      subtitle4Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w400,
        color: appColors.textPrimary,
      ),
      subtitle4Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w500,
        color: appColors.textPrimary,
      ),
      subtitle4SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w600,
        color: appColors.textPrimary,
      ),
      subtitle4Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w700,
        color: appColors.textPrimary,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => ThemeScope(
        appTypography: appTypography,
        appColors: appColors,
        child: widget.child,
      ),
    );
  }
}
