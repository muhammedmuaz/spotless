/// This [StorageManager] class is used for store value in locally ,
/// using [SharedPreferences] plugin is store value as key value pair

import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotless/shared/logger/logger.dart';

class StorageManager {
  const StorageManager._();

  static void init(SharedPreferences sharedPref) {
    _preferences = sharedPref;
    _instance = const StorageManager._();
  }

  factory StorageManager() {
    return _instance!;
  }

  static StorageManager? _instance;

  static StorageManager? get instance => _instance;
  static SharedPreferences? _preferences;

  /// Keys

  static const String user = 'user';
  static const String xToken = 'token';
  static const String xPhoneNo = 'phoneNo';
  static const String searchedQuery = 'searchedQuery';
  static const String currencyCode = 'currencyCode';
  static const String countryCode = 'countryCode';
  static const String savedCartItems = 'savedCartItems';
  static final String notification = 'notification';
  static final String notificationLength = 'notificationLength';



  Future<bool> saveStringValue(String key, String value) async {
    _preferences = await SharedPreferences.getInstance();
    final isSaved = await _preferences!.setString(key, value);
    isSaved ? Debug.log('Saved $key') : Debug.log('Error while saving $key');
    return isSaved;
  }

  Future<bool> saveIntValue(String key, int value) async {
    _preferences = await SharedPreferences.getInstance();
    final isSaved = await _preferences!.setInt(key, value);
    isSaved ? Debug.log('Saved $key') : Debug.log('Error while saving $key');
    return isSaved;
  }

  Future<bool> saveList(String key, List<String> list) async {
    _preferences = await SharedPreferences.getInstance();
    final isSaved = await _preferences!.setStringList(key, list);
    isSaved ? Debug.log('Saved $key') : Debug.log('Error while saving $key');
    return isSaved;
  }

  Future<bool> saveBoolValue(String key, bool value) async {
    _preferences = await SharedPreferences.getInstance();
    final isSaved = await _preferences!.setBool(key, value);
    isSaved ? Debug.log('Saved $key') : Debug.log('Error while saving $key');
    return isSaved;
  }

  bool? getBoolValue(String key) {
    if (_preferences != null) {
      bool? boolVal = _preferences!.getBool(key);
      if (boolVal == null) {
        return null;
      } else {
        return boolVal;
      }
    } else {
      Debug('empty preferneces var');
    }
    return null;
  }

  String? getStringValue(String key) {
    if (_preferences != null) {
      String? stringVal = _preferences!.getString(key);
      if (stringVal == null || stringVal == '') {
        return null;
      } else {
        return stringVal;
      }
    } else {
      Debug('empty preferneces var');
    }
    return null;
  }

  //TODO(jinto): Refactor these function; can be made into a single one.
  int? getIntValue(String key) {
    if (_preferences != null) {
      int? stringVal = _preferences!.getInt(key);
      if (stringVal == null) {
        return null;
      } else {
        return stringVal;
      }
    } else {
      Debug('empty preferneces var');
    }
    return null;
  }

  List<String>? getList(String key) {
    if (_preferences != null) {
      List<String>? listVal = _preferences!.getStringList(key);
      if (listVal == null || listVal == []) {
        return null;
      } else {
        return listVal;
      }
    } else {
      Debug('empty preferneces var');
    }
    return null;
  }

  Future<bool> clearAllPreferences() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return await sharedPreference.clear();
  }

  Future<bool> clearValueFromPrefs(String key) async {
    if (_preferences != null) {
      return await _preferences!.remove(key);
    }
    return false;
  }
}
