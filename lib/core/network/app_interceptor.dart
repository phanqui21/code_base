// ignore_for_file: deprecated_member_use, unused_field

import 'dart:io';

import 'package:dio/dio.dart';

import '../constants/app_constant.dart';
import '../local_storage/session_manager.dart';

class AppInterceptor extends Interceptor {
  final Dio _dio;

  AppInterceptor(this._dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await SessionManager.instance.accessToken ?? '';
    if (token.isEmpty) {
      options.headers = {
        'Authorization': 'Bearer $token',
        'Connection': 'keep-alive',
        'x-public-permission-token': AppConstant.xPublicPermissionToken,
      };
    } else {
      options.headers = {
        'Authorization': 'Bearer $token',
        'Connection': 'keep-alive',
        'x-access-token': token
      };
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {}
    super.onError(err, handler);
  }
}
