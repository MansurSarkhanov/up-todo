import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/components/custom_appbar.dart';
import 'package:up_todo/shared/components/custom_button.dart';

import '../../../../core/routes/routes.dart';
import '../../bloc/onboarding_bloc.dart';
import '../../bloc/onboarding_event.dart';
import '../../bloc/onboarding_state.dart';
import '../widgets/onboard_content.dart';

part '../widgets/navigation_buttons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(toolbarHeight: 0),
      backgroundColor: context.colors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => _controller.jumpToPage(
                    OnboardingModel.contents.length - 1,
                  ),
                  child: Text(
                    "SKIP",
                    style: context.typography.body2Regular.copyWith(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (context, state) {
                    final currentIndex = state.currentIndex;
                    return Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _controller,
                            itemCount: OnboardingModel.contents.length,
                            onPageChanged: (index) {
                              context.read<OnboardingBloc>().add(
                                PageChanged(index),
                              );
                            },
                            itemBuilder: (_, i) {
                              final content = OnboardingModel.contents[i];
                              return OnboardContent(
                                currentIndex: currentIndex,
                                description: content.description,
                                image: content.image,
                                title: content.title,
                              );
                            },
                          ),
                        ),
                        _NavigationButtons(
                          currentIndex: currentIndex,
                          controller: _controller,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
