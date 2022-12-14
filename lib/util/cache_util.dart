import 'package:flutter_keychain/flutter_keychain.dart';

class CacheUtil {
  static void putString(String key, String value) async {
    await FlutterKeychain.put(key: key, value: value);
  }

  static void putBoolean(String key, bool value) async {
    await FlutterKeychain.put(key: key, value: value.toString());
  }

  static void putInt(String key, int value) async {
    await FlutterKeychain.put(key: key, value: value.toString());
  }

  static Future<String> getString(String key) async {
    final value = await FlutterKeychain.get(key: key);
    return value ?? '';
  }

  static Future<bool> getBoolean(String key) async {
    final value = await FlutterKeychain.get(key: key);
    return value == 'true';
  }

  static Future<int> getInt(String key) async {
    final value = await FlutterKeychain.get(key: key);
    return int.parse((value ?? '0'));
  }

  static Future<void> remove(String key) async {
    await FlutterKeychain.remove(key: key);
  }

  static Future<void> clear() async {
    FlutterKeychain.clear();
  }
}
