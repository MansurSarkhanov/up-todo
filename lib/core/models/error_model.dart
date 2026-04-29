import 'package:equatable/equatable.dart';

class ApiErrorResponse extends Equatable {
  const ApiErrorResponse({required this.message});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(message: json['message'] as String);
  }
  final String message;

  @override
  List<Object?> get props => [message];
}
