import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDataService {
  static final FlutterSecureStorage storage = FlutterSecureStorage();
  static const String notificationKey = 'notifications';
  static const int maxNotifications = 10;
  static Map<String, String> _cache = {};

  static Future<void> init() async {
    _cache = await storage.readAll();
  }

  static Future<void> set(String key, String value) async {
    await storage.write(key: key, value: value);
    _cache[key] = value;
  }

  static String? get(String key) {
    return _cache[key];
  }

  static Future<void> setBool(String key, bool value) async {
    await storage.write(key: key, value: value.toString());
    _cache[key] = value.toString();
  }

  static bool? getBool(String key) {
    return _cache[key] == 'true';
  }

  // static Future<void> clearPref() async {
  //   await storage.deleteAll();
  //   _cache.clear();
  //   HomeService.currentHome = null;
  //   await setBool("intro", true);
  // }
}
