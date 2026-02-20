import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int pageCount;

  OnboardingBloc({required this.pageCount})
    : super(OnboardingState(currentIndex: 0)) {
    on<PageChanged>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<NextPressed>((event, emit) {
      if (state.currentIndex < pageCount - 1) {
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      }
    });

    on<BackPressed>((event, emit) {
      if (state.currentIndex > 0) {
        emit(state.copyWith(currentIndex: state.currentIndex - 1));
      }
    });
  }
}
