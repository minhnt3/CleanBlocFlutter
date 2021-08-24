import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart';

import 'config/shared_pref_key.dart';
import 'error/shared_pref_exception.dart';
import 'model/preference_user_data.dart';

@LazySingleton()
class AppPreferences {
  final SharedPreferences _sharedPreference;

  AppPreferences(this._sharedPreference);

  Future<bool> saveAccessToken(String token) {
    if (kIsWeb) {
      window.document.cookie = 'username=$token; max-age=31536000';
      return Future.value(true);
    }
    return _sharedPreference
        .setString(SharedPrefKey.accessToken, token)
        .catchError((error) => throw SharedPrefException('Can not save access token', error));
  }

  String get accessToken {
    if (kIsWeb) {
      return window.document.cookie ?? '';
    }
    return _sharedPreference.getString(SharedPrefKey.accessToken) ?? '';
  }

  Future<bool> saveRefreshToken(String token) {
    return _sharedPreference
        .setString(SharedPrefKey.refreshToken, token)
        .catchError((error) => throw SharedPrefException('Can not save refresh token', error));
  }

  String get refreshToken {
    return _sharedPreference.getString(SharedPrefKey.refreshToken) ?? '';
  }

  bool get isLoggedIn {
    return accessToken.isNotEmpty;
  }

  Future<bool> saveCurrentUser(PreferenceUserData preferenceUserData) {
    return _sharedPreference
        .setString(SharedPrefKey.currentUser, json.encode(preferenceUserData))
        .catchError((error) => throw SharedPrefException('Can not save current user', error));
  }

  PreferenceUserData? get currentUser {
    final String? user = _sharedPreference.getString(SharedPrefKey.currentUser);
    if (user == null) return null;
    return PreferenceUserData.fromJson(json.decode(user));
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference
        .setBool(SharedPrefKey.isDarkMode, isDarkMode)
        .catchError((error) => throw SharedPrefException('Can not save isDarkMode flag', error));
  }

  bool get isDarkMode {
    return _sharedPreference.getBool(SharedPrefKey.isDarkMode) ?? false;
  }

  Future<bool> saveDeviceToken(String token) {
    return _sharedPreference
        .setString(SharedPrefKey.deviceToken, token)
        .catchError((error) => throw SharedPrefException('Can not save device token', error));
  }

  String get deviceToken {
    return _sharedPreference.getString(SharedPrefKey.deviceToken) ?? '';
  }

  Future<void> clearAllUserInfo() async {
    await Future.wait(
      [
        _sharedPreference.remove(SharedPrefKey.currentUser),
        _sharedPreference.remove(SharedPrefKey.accessToken),
        _sharedPreference.remove(SharedPrefKey.refreshToken),
      ],
    );
  }
}
