import 'package:shared_preferences/shared_preferences.dart';
import 'package:tads_app/src/data/local_source/source_keys.dart';

class LocalSource {
  LocalSource._();
  static LocalSource? _instance;
  static SharedPreferences? _localStorage;
  static Future<LocalSource> getInstance() async {
    if (_instance == null) {
      final secureStorage = LocalSource._();
      await secureStorage._init();
      _instance = secureStorage;
    }
    return _instance!;
  }

  Future _init() async {
    _localStorage = await SharedPreferences.getInstance();
  }

  Future<void> setLocale(String value) async {
    await _localStorage?.setString(SourceKeys.locale, value);
  }

  Future<void> setChuck(bool value) async {
    await _localStorage?.setBool(SourceKeys.chuck, value);
  }

  Future<void> setAccessToken(String value) async {
    await _localStorage?.setString(SourceKeys.accessToken, value);
  }

  static getLocale() async {
    return _localStorage?.getString(SourceKeys.locale) ?? 'ru';
  }

  static getChuck() {
    return _localStorage?.getBool(SourceKeys.chuck) ?? false;
  }

  static getAccessToken() {
    return _localStorage?.getBool(SourceKeys.accessToken) ?? false;
  }

  static Future<void> clearProfile() async {
    await _localStorage?.remove(SourceKeys.accessToken);
  }

}