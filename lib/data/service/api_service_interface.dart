
import '../model/api/response_model.dart';

abstract class ApiServiceInterface{
  Future<ResponseModel> getRequest(String url, Map<String,String> header);
  Future<ResponseModel> postRequest(String url,Map<String,String> header, Map<String,dynamic>? map);
  Future<ResponseModel> putRequest(String url,Map<String,String> header, Map<String,dynamic>? map);
  Future<ResponseModel> multipartRequest(String url,Map<String,String> header,Map<String,String> fields, Map<String,dynamic>? files);
  Future<String> fetchApiToken();
}