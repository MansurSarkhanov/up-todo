import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.currentIndex,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          24.verticalSpace,
          Expanded(child: Image.asset(image)),
          36.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              OnboardingModel.contents.length,
              (index) => Container(
                height: 4,
                width: 25,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: currentIndex == index
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),
          36.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.typography.h1Bold,
          ),
          24.verticalSpace,
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.typography.body2Regular.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          80.verticalSpace,
        ],
      ),
    );
  }
}

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
  static List<OnboardingModel> get contents => [
    OnboardingModel(
      image: 'assets/images/board1.png',
      title: 'Manage your tasks',
      description:
          'You can easily manage all of your daily tasks in DoMe for free',
    ),
    OnboardingModel(
      image: 'assets/images/board2.png',
      title: 'Create daily routine',
      description:
          'In Uptodo you can create your personalized routine to stay productive',
    ),
    OnboardingModel(
      image: 'assets/images/board3.png',
      title: 'Organize your tasks',
      description:
          'You can organize your daily tasks by adding your tasks into separate categories',
    ),
  ];
}
