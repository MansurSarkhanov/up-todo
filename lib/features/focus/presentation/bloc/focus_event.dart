abstract class FocusEvent {}

class StartFocusEvent extends FocusEvent {
  StartFocusEvent({this.durationSeconds = 1500, this.userId});
  final int durationSeconds;
  final String? userId;
}

class PauseFocusEvent extends FocusEvent {}

class ResumeFocusEvent extends FocusEvent {}

class TickEvent extends FocusEvent {
  TickEvent({required this.remaining, this.userId});
  final int remaining;
  final String? userId;
}

class StopAndSaveFocusEvent extends FocusEvent {
  StopAndSaveFocusEvent({required this.userId});
  final String userId;
}
