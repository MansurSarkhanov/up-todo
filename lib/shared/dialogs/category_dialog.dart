import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_todo/core/constants/icons.dart';
import 'package:up_todo/shared/animations/animated_button_effect.dart';
import 'package:up_todo/shared/components/custom_button.dart';

import '../../core/models/category_model.dart';
import '../../core/utils/extensions/context_extension.dart';

class CategoryDialog extends StatefulWidget {
  const CategoryDialog({super.key});

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Choose Category", style: context.typography.body1SemiBold),
            12.verticalSpace,
            Divider(color: context.colors.strokeColor, height: 0),
            16.verticalSpace,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category.name;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category.name;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimationButtonEffect(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? category.color.withValues(alpha: 0.7)
                                : category.color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(category.icon),
                          ),
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        category.name,
                        style: context.typography.subtitle4Bold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    color: Colors.transparent,
                    textColor: context.colors.primary,
                    text: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                6.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    text: 'Save',
                    onTap: () {
                      Navigator.pop(context, selectedCategory);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<CategoryModel> categories = [
  CategoryModel(
    icon: AppIconPath.bread,
    name: "Grocery",
    color: Color(0xFFCCFF80),
  ),
  CategoryModel(
    icon: AppIconPath.briefcase,
    name: "Work",
    color: Color(0xFFFF9680),
  ),
  CategoryModel(
    icon: AppIconPath.sport,
    name: "Sports",
    color: Color(0xFF80FFFF),
  ),
  CategoryModel(
    icon: AppIconPath.design,
    name: "Design",
    color: Color(0xFF80FFD9),
  ),
  CategoryModel(
    icon: AppIconPath.mortarboard,
    name: "University",
    color: Color(0xFF809CFF),
  ),
  CategoryModel(
    icon: AppIconPath.megaphone,
    name: "Social",
    color: Color(0xFFFF80EB),
  ),
  CategoryModel(
    icon: AppIconPath.music,
    name: "Music",
    color: Color(0xFFFC80FF),
  ),
  CategoryModel(
    icon: AppIconPath.heartbeat,
    name: "Health",
    color: Color(0xFF80FFA3),
  ),
  CategoryModel(
    icon: AppIconPath.videoCamera,
    name: "Movie",
    color: Color(0xFF80D1FF),
  ),
  CategoryModel(icon: AppIconPath.home, name: "Home", color: Color(0xFFFFCC80)),
];
