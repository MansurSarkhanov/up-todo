import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dimensions.dart';

final class AppPadding extends EdgeInsets {
  const AppPadding._() : super.all(0);

  static EdgeInsets pageHorizontal() =>
      EdgeInsets.symmetric(horizontal: Dimensions.appHorizontalPadding);
  static EdgeInsets pageVertical() =>
      EdgeInsets.symmetric(horizontal: Dimensions.appVerticalPadding);

  static EdgeInsets get all4 => EdgeInsets.all(Dimensions.littlePadding);
  static EdgeInsets get all6 => EdgeInsets.all(Dimensions.xxsPadding);
  static EdgeInsets get all8 => EdgeInsets.all(Dimensions.xsPadding);
  static EdgeInsets get all10 => EdgeInsets.all(Dimensions.smPadding);
  static EdgeInsets get all12 => EdgeInsets.all(Dimensions.mdPadding);
  static EdgeInsets get all14 => EdgeInsets.all(Dimensions.lgPadding);
  static EdgeInsets get all16 => EdgeInsets.all(Dimensions.xlPadding);
  static EdgeInsets get all18 => EdgeInsets.all(Dimensions.xxlPadding);
  static EdgeInsets get all22 => EdgeInsets.all(22.dm);
  static EdgeInsets get all24 => EdgeInsets.all(24.dm);

  //Symmetric
  static EdgeInsets get horizontal4 => EdgeInsets.symmetric(horizontal: 4.w);
  static EdgeInsets get horizontal6 => EdgeInsets.symmetric(horizontal: 6.w);
  static EdgeInsets get horizontal8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get horizontal10 => EdgeInsets.symmetric(horizontal: 10.w);
  static EdgeInsets get horizontal12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get horizontal14 => EdgeInsets.symmetric(horizontal: 14.w);
  static EdgeInsets get horizontal16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get horizontal18 => EdgeInsets.symmetric(horizontal: 18.w);
  static EdgeInsets get horizontal20 => EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets get horizontal22 => EdgeInsets.symmetric(horizontal: 22.w);
  static EdgeInsets get horizontal24 => EdgeInsets.symmetric(horizontal: 24.w);
}
