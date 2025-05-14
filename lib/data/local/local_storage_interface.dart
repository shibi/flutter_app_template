
abstract class LocalStorageInterface{
  Future<void> putString(String key, String value);
  Future<void> putBool(String key, bool value);
  Future<void> putInt(String key, int value);

  Future<String> getString(String key);
  Future<bool> getBool(String key);
  Future<int> getInt(String key);
}