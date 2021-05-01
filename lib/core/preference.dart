import 'package:shared_preferences/shared_preferences.dart';

class PreferenceDriver {
  late var _preferences = SharedPreferences.getInstance();
  PreferenceDriver._();
  static final PreferenceDriver instance = PreferenceDriver._();
  read(String key) async {
    var pref = await _preferences;
    return pref.get(key);
  }

  write<T>(String key, T) async {
    var pref = await _preferences;
    switch (T) {
      case bool:
        return await pref.setBool(key, T);
      case String:
        return await pref.setString(key, T);
      case int:
        return await pref.setInt(key, T);
      case double:
        return await pref.setDouble(key, T);
      case List:
        return await pref.setStringList(key, T);
      default:
        return await pref.setString(key, T.toString());
    }
  }

  search(key) async {
    var pref = await _preferences;
    return pref.containsKey(key);
  }

  clear() async {
    var pref = await _preferences;
    return pref.clear();
  }
}
