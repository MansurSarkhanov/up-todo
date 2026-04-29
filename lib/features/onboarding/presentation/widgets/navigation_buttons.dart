part of '../screens/onboarding_screen.dart';

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.currentIndex,
    required PageController controller,
  }) : _controller = controller;

  final int currentIndex;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: currentIndex == 0
              ? null
              : () => _controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
          child: Text(
            'BACK',
            style: TextStyle(
              color: currentIndex == 0
                  ? Colors.transparent
                  : Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          child: CustomButton(
            onTap: () {
              if (currentIndex == OnboardingModel.contents.length - 1) {
                context.push(Routes.login);
                CacheManager.saveData<bool>('isFirst', true);
                return;
              }
              unawaited(
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
              );
            },
            text: currentIndex == OnboardingModel.contents.length - 1
                ? 'GET STARTED'
                : 'NEXT',
          ),
        ),
      ],
    );
  }
}
