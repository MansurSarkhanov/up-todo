import 'package:flutter/material.dart';
import 'package:up_todo/core/theme/app_colors.dart';
import 'package:up_todo/core/theme/app_typography.dart';

extension Translations on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColors get colors => theme.extension<AppColors>()!;
  AppTypography get typography => theme.extension<AppTypography>()!;
}
