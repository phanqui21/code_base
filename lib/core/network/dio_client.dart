// ignore_for_file: override_on_non_overriding_member
import 'package:dio/dio.dart';

import '../../../config/build_config.dart';
import '../../models/response/api_response.dart';
import 'app_interceptor.dart';

class DioClient {
  final Dio _dio;
  final BuildConfig _buildConfig;

  DioClient(this._dio, this._buildConfig) {
    _dio
      ..options.baseUrl = _buildConfig.baseUrl
      ..options.connectTimeout = _buildConfig.connectionTimeout
      ..options.receiveTimeout = _buildConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(<Interceptor>[
        AppInterceptor(_dio),
        LogInterceptor()
      ]);
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
      return _mappingResponse(result, mapper);
    } catch (e) {
      if (e is DioException) {
        return _mappingResponse(e.response, null);
      }
      return ApiResponse<T?>(message: e.toString());
    }
  }

  @override
  String _fullPathUrl(String path, {String? baseUrl}) =>
      '${baseUrl ?? '${_buildConfig.baseUrl}${_buildConfig.apiVersion}'}$path';

  ApiResponse<T?> _mappingResponse<T>(
      Response<dynamic>? response, T? Function(dynamic)? mapper) {
    final Map<String, dynamic> data = response?.data ?? {};
    final int? serverCode = data['statusCode'];
    final String? serverMessage = data['message'];
    return ApiResponse<T?>(
      data: mapper?.call(data['data']),
      code: serverCode ?? response?.statusCode ?? 0,
      message: serverMessage ?? response?.statusMessage ?? '',
    );
  }
}
