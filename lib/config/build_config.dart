import '../core/enums/app_environment.dart';

class BuildConfig {
  static const String kPrdBaseUrl = 'https://example.prd.com';
  static const String kStgBaseUrl = 'https://example.stg.com';
  static const String kDevBaseUrl = 'https://example.dev.com';

  AppEnvironment _environment = AppEnvironment.dev;

  AppEnvironment get environment => _environment;
  String _baseUrl = '';
  String _apiVersion = '';

  String get apiVersion => _apiVersion;

  String get baseUrl => _baseUrl;

  Duration get receiveTimeout => const Duration(minutes: 1);

  Duration get connectionTimeout => const Duration(minutes: 1);

  BuildConfig(AppEnvironment environment) {
    _environment = environment;
    _baseUrl = _initBaseUrl();
    _apiVersion = '/api/';
  }

  String _initBaseUrl() {
    switch (_environment) {
      case AppEnvironment.prd:
        return kPrdBaseUrl;
      case AppEnvironment.stg:
        return kStgBaseUrl;
      case AppEnvironment.dev:
        return kDevBaseUrl;
    }
  }
}
