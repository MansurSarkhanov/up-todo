abstract class FocusEvent {}

class StartFocusEvent extends FocusEvent {
  final int durationSeconds;
  final String? userId;
  StartFocusEvent({this.durationSeconds = 1500, this.userId});
}

class PauseFocusEvent extends FocusEvent {}

class ResumeFocusEvent extends FocusEvent {}

class TickEvent extends FocusEvent {
  final int remaining;
  final String? userId;
  TickEvent({required this.remaining, this.userId});
}

class StopAndSaveFocusEvent extends FocusEvent {
  final String userId;

  StopAndSaveFocusEvent({required this.userId});
}
