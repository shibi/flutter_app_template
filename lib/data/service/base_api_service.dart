import 'package:flutter_app_template/data/model/api/response_model.dart';
import 'package:flutter_app_template/data/service/api_service_interface.dart';
import 'package:get/get.dart';

import '../local/local_storage_manager.dart';


class BaseApiService extends GetxService implements ApiServiceInterface {

  final LocalStorageManager localStorageManager;

  BaseApiService({required this.localStorageManager});

  @override
  Future<String> fetchApiToken() {
    return localStorageManager.getApiToken();
  }

  @override
  Future<ResponseModel> getRequest(String url, Map<String, String> header) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> postRequest(String url, Map<String, String> header, Map<String, dynamic>? map) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> putRequest(String url, Map<String, String> header, Map<String, dynamic>? map) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> multipartRequest(String url, Map<String, String> header, Map<String, String> fields, Map<String, dynamic>? files) {
    throw UnimplementedError();
  }

}