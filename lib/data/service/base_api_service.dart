import 'package:flutter_app_template/core/helper/api_helper.dart';
import 'package:flutter_app_template/core/helper/log_helper.dart';
import 'package:flutter_app_template/data/model/api/response_model.dart';
import 'package:flutter_app_template/data/service/api_service_interface.dart';
import '../local/local_storage_manager.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class BaseApiService extends GetxService implements ApiServiceInterface {

  final LocalStorageManager localStorageManager;

  BaseApiService({required this.localStorageManager});

  @override
  Future<String> fetchApiToken() {
    return localStorageManager.getApiToken();
  }

  @override
  Future<ResponseModel> getRequest(String url, Map<String, String> header) async{
    http.Response? response = await get(
      Uri.parse(url),
      headers: header,
    );
    return processResponse(response);
  }

  @override
  Future<ResponseModel> postRequest(String url, Map<String, String> header, Map<String, dynamic>? map) async{
    http.Response? response = await post(
        Uri.parse(url),
        headers: header,
        body: ApiHelper.getJsonBody(map),
        encoding: ApiHelper.encoding
    );
    return await processResponse(response);
  }

  @override
  Future<ResponseModel> putRequest(String url, Map<String, String> header, Map<String, dynamic>? map) async{
    http.Response? response = await http.put(
        Uri.parse(url),
        headers: header,
        body: ApiHelper.getJsonBody(map),
        encoding: ApiHelper.encoding
    );
    return await processResponse(response);
  }

  @override
  Future<ResponseModel> multipartRequest(String url, Map<String, String> header, Map<String, String> fields, Map<String, dynamic>? files) {
    throw UnimplementedError();
  }

  Future<ResponseModel> processResponse(http.Response response) async{
    LogHelper.log('status code ${response.statusCode}');
    LogHelper.log('response body> ${response.body}');

    if (response.statusCode == 200) {
      return ResponseModel(true, 'Success', response.body);
    } if (response.statusCode == 400) {
      String message = response.body;
      return ResponseModel(false, message, response.body);
    } /*else if(response.statusCode == 401){
      throw TokenExpiredException();
    }else{
      return processError(response.body);
    }*/
    return ResponseModel(false, 'Error', response.body);
  }
}