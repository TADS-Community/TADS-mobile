import 'package:shared_preferences/shared_preferences.dart';
import 'package:tads_app/src/core/local_source/storage_keys.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static SharedPreferences? _localStorage;

  static Future<LocalStorage> getInstance() async {
    if (_instance == null) {
      final secureStorage = LocalStorage();
      await secureStorage._init();
      _instance = secureStorage;
    }
    return _instance!;
  }

  Future _init() async {
    _localStorage = await SharedPreferences.getInstance();
  }

  static Future<void> setLocale(String value) async {
    await _localStorage?.setString(StorageKeys.locale, value);
  }

  static Future<void> setChuck(bool value) async {
    await _localStorage?.setBool(StorageKeys.chuck, value);
  }

  static Future<void> setAccessToken(String value) async {
    await _localStorage?.setString(StorageKeys.accessToken, value);
  }

  static Future<void> setRefreshToken(String value) async {
    await _localStorage?.setString(StorageKeys.refreshToken, value);
  }

  static Future<void> setThemeMode(String value) async {
    await _localStorage?.setString(StorageKeys.themeMode, value);
  }

  static Future<void> setID(int value) async {
    await _localStorage?.setInt(StorageKeys.id, value);
  }

  static Future<void> setPinCode(String value) async {
    await _localStorage?.setString(StorageKeys.pinCode, value);
  }

  static String get getLocale =>
      _localStorage?.getString(StorageKeys.locale) ?? 'uz';

  static bool get getChuck =>
      _localStorage?.getBool(StorageKeys.chuck) ?? false;

  static String get getAccessToken =>
      _localStorage?.getString(StorageKeys.accessToken) ?? '';

  static String get getRefreshToken =>
      _localStorage?.getString(StorageKeys.refreshToken) ?? '';

  static String get getThemeMode =>
      _localStorage?.getString(StorageKeys.themeMode) ?? 'dark';

  static int get getID =>
      _localStorage?.getInt(StorageKeys.id) ?? -1;

  static String get getPinCode =>
      _localStorage?.getString(StorageKeys.pinCode) ?? '';

  static Future<void> clearProfile() async {
    await _localStorage?.remove(StorageKeys.accessToken);
  }
}
