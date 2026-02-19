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
  String get appFont => 'Roboto';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final appColors = AppLightColors();
    final appTypography = AppTypography(
      h1Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      h2Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      h3Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      h4Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      h5Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      h6Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      h1Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      h2Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      h3Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      h4Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      h5Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      h6Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      h1Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      h2Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      h3Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      h4Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      h5Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      h6Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      h1SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      h2SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      h3SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      h4SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      h5SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline5,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      h6SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline6,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      h1Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline1,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      h2Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline2,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      h3Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline3,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      h4Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.headline4,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
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
        color: appColors.neutralTitle,
      ),
      body1Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      body2Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      body1Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      body2Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      body1Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      body2Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      body1SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body1,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      body2SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.body2,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      captionLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      captionRegular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      captionMedium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      captionSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.caption,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      overlineLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      overlineRegular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      overlineMedium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      overlineSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overline,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      overlineSmallLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      overlineSmallRegular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      overlineSmallMedium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      overlineSmallSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineSmall,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      overlineLargeLight: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineLarge,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
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
        color: appColors.neutralTitle,
      ),
      overlineLargeSemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.overlineLarge,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      subtitle1Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      subtitle1Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      subtitle1Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      subtitle1SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      subtitle1Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle1,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      subtitle2Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      subtitle2Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      subtitle2Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      subtitle2SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      subtitle2Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle2,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      subtitle3Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      subtitle3Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      subtitle3Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      subtitle3SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      subtitle3Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle3,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
      ),
      subtitle4Light: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w300,
        color: appColors.neutralTitle,
      ),
      subtitle4Regular: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w400,
        color: appColors.neutralTitle,
      ),
      subtitle4Medium: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w500,
        color: appColors.neutralTitle,
      ),
      subtitle4SemiBold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w600,
        color: appColors.neutralTitle,
      ),
      subtitle4Bold: TextStyle(
        fontFamily: appFont,
        fontSize: Dimensions.subtitle4,
        fontWeight: FontWeight.w700,
        color: appColors.neutralTitle,
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
