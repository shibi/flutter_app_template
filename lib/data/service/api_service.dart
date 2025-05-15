import 'dart:io';

import 'package:flutter_app_template/core/helper/api_helper.dart';
import 'package:flutter_app_template/core/helper/log_helper.dart';
import 'package:flutter_app_template/data/service/base_api_service.dart';

import '../model/api/response_model.dart';
import 'method.dart';

class ApiService extends BaseApiService{

  ApiService({required super.localStorageManager});

  Future<ResponseModel> apiRequest({required String url, required String method, bool passHeader = true, Map<String, dynamic>? map}) async{
    try {

      //print api request characteristics
      traceApi(url: url, method: method , passHeader: passHeader, map: map);

      //prepare header with token, if token is required
      String token = (passHeader)? await fetchApiToken() : '';
      var header = ApiHelper.getHeaders(token: token);


      switch(method){
        case Method.GET:
          return await getRequest(url, header);
        case Method.POST:
          return await postRequest(url, header, map);
        case Method.PUT:
          return await putRequest(url, header, map);
      }

      return ResponseModel(false, 'No method found', '');

    }  on SocketException {
      return ResponseModel(false, 'NO CONNECTIVITY', '');
    }
  }

  void traceApi({String? url, String? method, bool? passHeader, Map<String, dynamic>? map}){
    logger('url', url?.toString()??'Url empty');
    logger('method', method??'Method empty');
    logger('params', map?.toString()??'Params empty');
    logger('params', (passHeader!=null && passHeader == true)?'Auth api':'No auth api');
  }

  void logger(String title, String msg){
    LogHelper.log('$title - $msg');
  }
}