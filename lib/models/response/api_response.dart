import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    @Default('') String version,
    @Default(false) bool success,
    @Default(0) int code,
    @Default('') String message,
    T? data,
  }) = _ApiResponseData;

  const ApiResponse._();

  void fold({
    Function(ApiResponse<T>)? success,
    Function(String)? error,
  }) {
    if (code >= 200 && 400 > code) {
      success?.call(this);
    } else {
      error?.call(message);
    }
  }

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
