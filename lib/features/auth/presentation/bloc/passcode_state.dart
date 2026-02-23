// passcode_state.dart

import 'package:equatable/equatable.dart';

class PasscodeState extends Equatable {
  final List<int> enteredPin;
  final List<int> confirmEnteredPin;

  final bool isSuccess;
  final bool isError;

  const PasscodeState({
    this.enteredPin = const [],
    this.confirmEnteredPin = const [],
    this.isSuccess = false,
    this.isError = false,
  });

  PasscodeState copyWith({
    List<int>? enteredPin,
    List<int>? confirmEnteredPin,
    bool? isSuccess,
    bool? isError,
  }) {
    return PasscodeState(
      enteredPin: enteredPin ?? this.enteredPin,
      confirmEnteredPin: confirmEnteredPin ?? this.confirmEnteredPin,
      isSuccess: isSuccess ?? false,
      isError: isError ?? false,
    );
  }

  @override
  List<Object?> get props => [
    enteredPin,
    isSuccess,
    isError,
    confirmEnteredPin,
  ];
}
