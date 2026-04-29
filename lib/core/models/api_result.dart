import 'package:up_todo/core/models/error_model.dart';

class ApiResult<T> {
  ApiResult._({
    required this.isSuccess,
    this.data,
    this.error,
    this.statusCode,
  });

  factory ApiResult.success({T? data}) {
    return ApiResult._(data: data, isSuccess: true);
  }

  factory ApiResult.failure({
    required ApiErrorResponse error,
    int? statusCode,
  }) {
    return ApiResult._(error: error, statusCode: statusCode, isSuccess: false);
  }
  final T? data;
  final ApiErrorResponse? error;
  final int? statusCode;
  final bool isSuccess;
}
