class OnboardingState {
  final int currentIndex;

  OnboardingState({required this.currentIndex});

  OnboardingState copyWith({int? currentIndex}) {
    return OnboardingState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
