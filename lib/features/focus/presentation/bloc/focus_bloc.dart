import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/focus/domain/usecases/save_focus_usecase.dart';

import 'focus_event.dart';
import 'focus_state.dart';

class FocusBloc extends Bloc<FocusEvent, FocusState> {
  final SaveFocusUsecase saveFocusUsecase;
  StreamSubscription<int>? _tickerSubscription;

  FocusBloc({required this.saveFocusUsecase}) : super(FocusInitial()) {
    on<StartFocusEvent>(_onStarted);
    on<PauseFocusEvent>(_onPaused);
    on<ResumeFocusEvent>(_onResumed);
    on<TickEvent>(_onTick);
    on<StopAndSaveFocusEvent>(_onStopAndSave);
  }

  void _onStarted(StartFocusEvent event, Emitter<FocusState> emit) {
    emit(FocusRunning(event.durationSeconds, event.durationSeconds));
    _startTicker(event.durationSeconds, event.userId);
  }

  void _onPaused(PauseFocusEvent event, Emitter<FocusState> emit) {
    _tickerSubscription?.pause();
    emit(FocusPaused(state.remainingSeconds, state.totalTargetSeconds));
  }

  void _onResumed(ResumeFocusEvent event, Emitter<FocusState> emit) {
    _tickerSubscription?.resume();
    emit(FocusRunning(state.remainingSeconds, state.totalTargetSeconds));
  }

  void _onTick(TickEvent event, Emitter<FocusState> emit) {
    if (event.remaining > 0) {
      emit(FocusRunning(event.remaining, state.totalTargetSeconds));
    } else {
      add(StopAndSaveFocusEvent(userId: event.userId!));
    }
  }

  Future<void> _onStopAndSave(
    StopAndSaveFocusEvent event,
    Emitter<FocusState> emit,
  ) async {
    _tickerSubscription?.cancel();
    final int focusedSeconds =
        state.totalTargetSeconds - state.remainingSeconds;
    final result = await saveFocusUsecase.call(
      userId: event.userId,
      durationSeconds: focusedSeconds,
      targetSeconds: state.totalTargetSeconds,
    );
    result.fold(
      (success) => emit(FocusCompleted()),
      (error) => emit(FocusError(error)),
    );
  }

  void _startTicker(int duration, String? userId) {
    _tickerSubscription?.cancel();
    _tickerSubscription =
        Stream.periodic(const Duration(seconds: 1), (x) => duration - x - 1)
            .take(duration)
            .listen(
              (remaining) =>
                  add(TickEvent(remaining: remaining, userId: userId)),
            );
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
