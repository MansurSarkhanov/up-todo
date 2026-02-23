// passcode_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/helpers/cache_manager.dart';

import '../screens/passcode_screen.dart';
import 'passcode_event.dart';
import 'passcode_state.dart';

class PasscodeBloc extends Bloc<PasscodeEvent, PasscodeState> {
  PasscodeBloc({required this.mode}) : super(const PasscodeState()) {
    on<NumberEntered>(_onNumberEntered);
    on<BackspacePressed>(_onBackspacePressed);
    on<ResetPin>(_onResetPin);
  }
  final PasscodeMode mode;

  String _correctPin = "";
  Future<void> loadPin() async {
    _correctPin = CacheManager.getData<String>('user_pin') ?? '';
  }

  Future<void> _onNumberEntered(
    NumberEntered event,
    Emitter<PasscodeState> emit,
  ) async {
    if (mode == PasscodeMode.setup) {
      if (state.enteredPin.length < 4) {
        final updatedPin = List<int>.from(state.enteredPin)..add(event.number);
        if (updatedPin.length == 4) {
          emit(state.copyWith(enteredPin: updatedPin, confirmEnteredPin: []));
        } else {
          emit(state.copyWith(enteredPin: updatedPin));
        }
      } else {
        final updatedConfirmPin = List<int>.from(state.confirmEnteredPin)
          ..add(event.number);
        if (updatedConfirmPin.length == 4) {
          if (state.enteredPin.join() == updatedConfirmPin.join()) {
            await CacheManager.saveData<String>(
              'user_pin',
              updatedConfirmPin.join(),
            );
            emit(
              state.copyWith(
                enteredPin: updatedConfirmPin,
                confirmEnteredPin: updatedConfirmPin,
                isSuccess: true,
                isError: false,
              ),
            );
          } else {
            emit(
              state.copyWith(
                enteredPin: [],
                confirmEnteredPin: [],
                isError: true,
              ),
            );
          }
        } else {
          emit(state.copyWith(confirmEnteredPin: updatedConfirmPin));
        }
      }
    } else {
      final updatedPin = List<int>.from(state.enteredPin)..add(event.number);
      if (updatedPin.length == 4) {
        final entered = updatedPin.join();

        if (entered == _correctPin) {
          emit(state.copyWith(enteredPin: updatedPin, isSuccess: true));
        } else {
          emit(state.copyWith(enteredPin: [], isError: true));
        }
      } else {
        emit(state.copyWith(enteredPin: updatedPin));
      }
    }
  }

  void _onBackspacePressed(
    BackspacePressed event,
    Emitter<PasscodeState> emit,
  ) {
    if (state.confirmEnteredPin.isNotEmpty) {
      final confirmPin = List<int>.from(state.confirmEnteredPin)..removeLast();
      emit(state.copyWith(confirmEnteredPin: confirmPin));
    } else {
      if (state.enteredPin.isEmpty) return;
      final updatedPin = List<int>.from(state.enteredPin)..removeLast();
      emit(state.copyWith(enteredPin: updatedPin));
    }
  }

  void _onResetPin(ResetPin event, Emitter<PasscodeState> emit) {
    emit(const PasscodeState());
  }
}
