import 'package:code_base/core/constants/api_path.dart';
import 'package:code_base/models/response/api_response.dart';
import 'package:code_base/models/user/user.dart';

import '../config/build_config.dart';
import '../core/network/dio_client.dart';

abstract class IUserRepository {
  Future<ApiResponse<List<User>?>> fetchListUser();
}

class UserRepositoryImpl implements IUserRepository {
  final DioClient dioClient;

  UserRepositoryImpl(this.dioClient);

  @override
  Future<ApiResponse<List<User>?>> fetchListUser() {
    return dioClient.get(
      APIPath.login,
      mapper: (json) {
        return List<User>.from(json);
      },
    );
  }
}
