abstract class FocusState {
  FocusState(this.remainingSeconds, this.totalTargetSeconds);
  final int remainingSeconds;
  final int totalTargetSeconds;
}

class FocusInitial extends FocusState {
  FocusInitial({int duration = 1500}) : super(duration, duration);
}

class FocusRunning extends FocusState {
  FocusRunning(super.remaining, super.total);
}

class FocusPaused extends FocusState {
  FocusPaused(super.remaining, super.total);
}

class FocusCompleted extends FocusState {
  FocusCompleted() : super(0, 1500);
}

class FocusError extends FocusState {
  FocusError(this.message) : super(0, 1500);
  final String message;
}
