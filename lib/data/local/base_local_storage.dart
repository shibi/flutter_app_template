import 'package:flutter_app_template/data/local/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseLocalStorage extends LocalStorageInterface{

  final SharedPreferences sharedPreferences;

  BaseLocalStorage({required this.sharedPreferences});

  @override
  Future<void> putString(String key, String value) async{
    sharedPreferences.setString(key, value);
  }

  @override
  Future<void> putBool(String key, bool value) async {
    sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> putInt(String key, int value) async{
    sharedPreferences.setInt(key, value);
  }

  @override
  Future<String> getString(String key) async {
    return sharedPreferences.getString(key)??'';
  }

  @override
  Future<int> getInt(String key) async{
    return sharedPreferences.getInt(key)??-1;
  }

  @override
  Future<bool> getBool(String key) async {
    return sharedPreferences.getBool(key)??false;
  }

  Future<bool> hasKey(String key) async{
    return sharedPreferences.containsKey(key);
  }

  Future<String> getStringOrEmpty(String key) async{
    String value = '';
    if(await hasKey(key)){
      value = await getString(key);
    }
    return value;
  }

}