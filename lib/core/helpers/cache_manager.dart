import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();

  factory CacheManager() => _instance;

  CacheManager._internal();

  static late final SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData<T>(String key, T value) async {
    return switch (T) {
      const (int) => prefs.setInt(key, value as int),
      const (double) => prefs.setDouble(key, value as double),
      const (bool) => prefs.setBool(key, value as bool),
      const (String) => prefs.setString(key, value as String),
      const (List<String>) => prefs.setStringList(key, value as List<String>),
      _ => Future.value(false),
    };
  }

  static T? getData<T>(String key) {
    return switch (T) {
      const (int) => prefs.getInt(key) as T?,
      const (double) => prefs.getDouble(key) as T?,
      const (bool) => prefs.getBool(key) as T?,
      const (String) => prefs.getString(key) as T?,
      const (List<String>) => prefs.getStringList(key) as T?,
      _ => null,
    };
  }

  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
