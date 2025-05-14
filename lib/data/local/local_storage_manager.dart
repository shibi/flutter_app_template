import 'package:flutter_app_template/data/local/base_local_storage.dart';
import '../../core/helper/SharedPreferenceHelper.dart';

class LocalStorageManager extends BaseLocalStorage{

  LocalStorageManager({required super.sharedPreferences});

  Future<String> getApiToken() async {
    String token = await getStringOrEmpty(SharedPreferenceHelper.accessToken);
    return token;
  }

  Future<String> getRefreshToken() async {
    String token = await getStringOrEmpty(SharedPreferenceHelper.refreshToken);
    return token;
  }

}