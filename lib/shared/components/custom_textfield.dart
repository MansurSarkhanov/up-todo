import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.obscureText,
    this.hintText,
    required this.controller,
    this.fillColor,
    this.hintTextColor,
    this.textInputAction,
  });
  final bool? obscureText;
  final String? hintText;
  final Color? hintTextColor;

  final TextEditingController controller;
  final Color? fillColor;
  final TextInputAction? textInputAction;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      style: context.typography.body2Regular,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.typography.body2Regular.copyWith(
          color: widget.hintTextColor ?? context.colors.hintTextColor,
        ),
        filled: true,
        fillColor: widget.fillColor ?? context.colors.textFieldBackColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular((Platform.isIOS ? 12.r : 4.r)),
          borderSide: BorderSide(color: context.colors.strokeColor, width: 0.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((Platform.isIOS ? 12.r : 4.r)),
          borderSide: BorderSide(color: context.colors.strokeColor, width: 0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((Platform.isIOS ? 12.r : 4.r)),
          borderSide: BorderSide(color: context.colors.primary),
        ),
      ),
    );
  }
}
