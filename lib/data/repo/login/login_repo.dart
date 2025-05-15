
import 'package:flutter_app_template/core/utils/url_container.dart';
import 'package:flutter_app_template/data/model/api/response_model.dart';
import 'package:flutter_app_template/data/repo/base/base_repo.dart';

import '../../service/method.dart';

class LoginRepo extends BaseRepo{
  
  LoginRepo({required super.apiService});
  
  Future<ResponseModel> requestLogin(String username, String password){
    Map<String,String> requestParams = {};
    requestParams["username"] = username;
    requestParams["password"] = password;
    String url = '${UrlContainer.baseUrl}${UrlContainer.login}';
    return apiService.apiRequest(url: url, method: Method.POST, map: requestParams);
  }
  
}