import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class ThemeScope extends InheritedWidget {
  const ThemeScope({
    super.key,
    required super.child,
    required this.appColors,
    required this.appTypography,
  });

  final AppTypography appTypography;
  final AppColors appColors;
  static ThemeScope of(BuildContext context) {
    final ThemeScope? result = context
        .dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(result != null, 'No ThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
