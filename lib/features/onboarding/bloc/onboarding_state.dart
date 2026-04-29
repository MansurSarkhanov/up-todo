class OnboardingState {
  OnboardingState({required this.currentIndex});
  final int currentIndex;

  OnboardingState copyWith({int? currentIndex}) {
    return OnboardingState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
