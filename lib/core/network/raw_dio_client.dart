// ignore_for_file: override_on_non_overriding_member
import 'package:dio/dio.dart';

import '../../../config/build_config.dart';
import '../../../models/response/api_response.dart';

class RawDioClient {
  final Dio _dio;
  final BuildConfig _buildConfig;

  RawDioClient(this._dio, this._buildConfig) {
    _dio
      ..options.baseUrl = _buildConfig.baseUrl
      ..options.connectTimeout = _buildConfig.connectionTimeout
      ..options.receiveTimeout = _buildConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(<Interceptor>[]);
  }

  Future<ApiResponse<T?>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    String? baseUrl,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(() {
      return _dio.get(
        _fullPathUrl(path, baseUrl: baseUrl),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    }, mapper);
  }

  Future<ApiResponse<T?>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(() {
      return _dio.post(_fullPathUrl(path, baseUrl: baseUrl),
          data: formData ?? data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);
    }, mapper);
  }

  Future<ApiResponse<T?>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    String? baseUrl,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(() {
      return _dio.put(
        _fullPathUrl(path, baseUrl: baseUrl),
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    }, mapper);
  }

  Future<ApiResponse<T?>> patch<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(() {
      return _dio.patch(
        _fullPathUrl(path, baseUrl: baseUrl),
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    }, mapper);
  }

  Future<ApiResponse<T?>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? baseUrl,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(() {
      return _dio.delete(
        _fullPathUrl(path, baseUrl: baseUrl),
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    }, mapper);
  }

  Future<ApiResponse<T?>> _handleResponse<T>(
    Future<Response<Map<String, dynamic>>> Function() func,
    T? Function(dynamic)? mapper,
  ) async {
    try {
      final Response<Map<String, dynamic>> result = await func();
      final Map<String, dynamic> data = result.data ?? {};
      return ApiResponse<T?>(success: true, data: mapper?.call(data));
    } catch (e) {
      return ApiResponse<T?>(message: e.toString(), success: false);
    }
  }

  @override
  String _fullPathUrl(String path, {String? baseUrl}) =>
      '${baseUrl ?? '${_buildConfig.baseUrl}${_buildConfig.apiVersion}'}$path';
}
