
import 'package:flutter_app_template/data/service/api_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/local/local_storage_manager.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences, fenix: true);

  Get.lazyPut(() => LocalStorageManager(sharedPreferences: Get.find()), fenix: true);
  Get.lazyPut(() => ApiService(localStorageManager: Get.find()), fenix: true);

}