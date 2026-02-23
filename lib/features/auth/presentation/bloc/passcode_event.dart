// passcode_event.dart

import 'package:equatable/equatable.dart';

abstract class PasscodeEvent extends Equatable {
  const PasscodeEvent();

  @override
  List<Object?> get props => [];
}

class NumberEntered extends PasscodeEvent {
  final int number;

  const NumberEntered(this.number);

  @override
  List<Object?> get props => [number];
}

class BackspacePressed extends PasscodeEvent {}

class ResetPin extends PasscodeEvent {}
