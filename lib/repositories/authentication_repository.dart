import '../config/build_config.dart';
import '../core/network/dio_client.dart';

abstract class IAuthenticationRepository {}

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final DioClient dioClient;
  final BuildConfig _buildConfig;

  AuthenticationRepositoryImpl(this.dioClient, this._buildConfig);
}
