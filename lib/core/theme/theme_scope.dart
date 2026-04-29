import 'package:flutter/material.dart';
import 'package:up_todo/core/theme/app_colors.dart';
import 'package:up_todo/core/theme/app_typography.dart';

class ThemeScope extends InheritedWidget {
  const ThemeScope({
    required super.child,
    required this.appColors,
    required this.appTypography,
    super.key,
  });

  final AppTypography appTypography;
  final AppColors appColors;
  static ThemeScope of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(result != null, 'No ThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
