import 'package:equatable/equatable.dart';

class ApiErrorResponse extends Equatable {
  final String message;

  const ApiErrorResponse({required this.message});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(message: json['message']);
  }

  @override
  List<Object?> get props => [message];
}
