import '../../config/build_config.dart';

extension AppEnvironmentExtension on AppEnvironment {
  String get bundleId {
    switch (this) {
      case AppEnvironment.prd:
        return 'com.example.code_base';
      case AppEnvironment.stg:
        return 'com.example.code_base.stg';
      case AppEnvironment.dev:
        return 'com.example.code_base.dev';
    }
  }

  String get baseUrl {
    switch (this) {
      case AppEnvironment.prd:
        return BuildConfig.kPrdBaseUrl;
      case AppEnvironment.stg:
        return BuildConfig.kStgBaseUrl;
      case AppEnvironment.dev:
        return BuildConfig.kDevBaseUrl;
    }
  }
}

enum AppEnvironment { dev, stg, prd }
