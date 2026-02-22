import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions/context_extension.dart';

class AppHelper {
  AppHelper._();

  static void showBottomSheet({
    required BuildContext context,
    required Widget child,
    bool? isScrollControlled,
  }) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled ?? false,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      backgroundColor: context.colors.secondary,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child,
      ),
    );
  }
}
