abstract class OnboardingEvent {}

class PageChanged extends OnboardingEvent {
  PageChanged(this.index);
  final int index;
}

class NextPressed extends OnboardingEvent {}

class BackPressed extends OnboardingEvent {}
