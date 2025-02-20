import 'dart:convert';

import 'package:dio/dio.dart';
import '../../models/user/user.dart';
import '../di/injection.dart';
import 'secure_storage.dart';
import 'secure_storage_keys.dart';
import 'shared_prefs.dart';

/// You might save your cached data to use entire app here
class SessionManager {
  static final instance = SessionManager._();

  SessionManager._();

  SecureStorage secureStorage = getIt<SecureStorage>();
  SharedPrefs preferences = getIt<SharedPrefs>();

  bool? get isDarkMode =>
      preferences.getData<bool>(SecureStorageKeys.themeMode);
  User? _user;

  User? get user => _user;

  set user(User? user) {
    _user = user?.copyWith();
  }

  Future<void> setIsDarkMode(bool val) async {
    return await preferences.saveData<bool>(
      SecureStorageKeys.themeMode,
      val,
    );
  }

  String? get cacheThemeModeName =>
      preferences.getData<String>(SecureStorageKeys.themeModeName);

  Future<void> setCacheThemeModeName(String themeModeName) async {
    return await preferences.saveData<String>(
      SecureStorageKeys.themeModeName,
      themeModeName,
    );
  }

  String? get cacheLanguage =>
      preferences.getData<String>(SecureStorageKeys.locale);

  Future<void> setCacheLanguage(String languageCode) async {
    return await preferences.saveData<String>(
      SecureStorageKeys.locale,
      languageCode,
    );
  }

  bool? get cachedLoggedInById =>
      preferences.getData<bool>(SecureStorageKeys.loggedInById);

  Future<void> setCachedLoggedInById(bool value) async {
    return await preferences.saveData<bool>(
      SecureStorageKeys.loggedInById,
      value,
    );
  }

  bool? get isRememberMe =>
      preferences.getData<bool>(SecureStorageKeys.rememberMe);

  Future<void> setIsRememberMe(bool val) async {
    return await preferences.saveData<bool>(
      SecureStorageKeys.rememberMe,
      val,
    );
  }

  Future<String?> get accessToken =>
      secureStorage.getValue(SecureStorageKeys.accessToken);

  Future<void> setAccessToken(String val) {
    return secureStorage.setValue(
      key: SecureStorageKeys.accessToken,
      value: val,
    );
  }

  Future<String?> get refreshToken =>
      secureStorage.getValue(SecureStorageKeys.refreshToken);

  Future<void> setRefreshToken(String val) {
    return secureStorage.setValue(
      key: SecureStorageKeys.refreshToken,
      value: val,
    );
  }

  Future<void> setCachedUser(String val) {
    return secureStorage.setValue(
      key: SecureStorageKeys.user,
      value: val,
    );
  }

  Future<String?> get cachedUser =>
      secureStorage.getValue(SecureStorageKeys.user);

  Future<String?> get email => secureStorage.getValue(SecureStorageKeys.email);

  Future<void> setEmail(String val) {
    return secureStorage.setValue(
      key: SecureStorageKeys.email,
      value: val,
    );
  }

  Future<String?> get password =>
      secureStorage.getValue(SecureStorageKeys.password);

  Future<void> setPassword(String val) {
    return secureStorage.setValue(
      key: SecureStorageKeys.password,
      value: val,
    );
  }

  Future<void> clearAll() async {
    _user = null;
    await setCachedUser('');
    await setAccessToken('');
  }
}
