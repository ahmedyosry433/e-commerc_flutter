import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  static PublishSubject<bool> _isPreferencesInitializedSubject =
      PublishSubject();
  static Stream<bool> get isPreferencesInitializedStream =>
      _isPreferencesInitializedSubject.stream;

  static final SharedPrefrenceHelper _instance =
      SharedPrefrenceHelper._internal();

  factory SharedPrefrenceHelper() {
    return _instance;
  }

  SharedPrefrenceHelper._internal();

  static _initPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _isPreferencesInitializedSubject.sink.add(true);
  }

  dynamic getValueForKey(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    return _prefs.get(key);
  }

  setValueForKey(String key, dynamic value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (value == null) {
      removeValueForKey(key);
    } else if (value is int) {
      _prefs.setInt(key, value);
    } else if (value is String) {
      _prefs.setString(key, value);
    } else if (value is bool) {
      _prefs.setBool(key, value);
    } else {
      throw "unknown value type :(";
    }
  }

  removeAllKeys() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  Future<bool> removeValueForKey(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.remove(key);
  }
}
