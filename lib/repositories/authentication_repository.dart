import 'package:code_base/core/constants/api_path.dart';
import 'package:dio/dio.dart';

import '../core/network/dio_client.dart';
import '../models/response/api_response.dart';
import '../models/user/user.dart';

abstract class IAuthenticationRepository {
  Future<User?> login({
    required String username,
    required String password,
    int expiresInMins = 60,
  });

  Future<ApiResponse> refreshToken({
    required String refreshToken,
    int expiresInMins = 60,
  });

  Future<ApiResponse<User?>> getUser();
}

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final DioClient dioClient;

  AuthenticationRepositoryImpl(this.dioClient);

  @override
  Future<User?> login({
    required String username,
    required String password,
    int expiresInMins = 60,
  }) async {
    User? user;
    Dio _dio = Dio();
    final request = await _dio.post("https://dummyjson.com/auth/login",
        data: <String, dynamic>{
          'username': username,
          'password': password,
          'expiresInMins': expiresInMins,
        },);
    return user = User.fromJson(request.data);
  }

  @override
  Future<ApiResponse<User?>> getUser() {
    return dioClient.get(
      APIPath.getUser,
      mapper: (json) {
        return User.fromJson(json);
      },
    );
  }

  @override
  Future<ApiResponse> refreshToken({required String refreshToken, int expiresInMins = 60}) {
    return dioClient.post(
      APIPath.refreshToken,
      mapper: (json) {
        return json;
      },
    );
  }
}
