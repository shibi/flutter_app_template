
import 'package:get/get.dart';

import '../../../core/utils/string_resources.dart';
import '../../model/api/response_model.dart';

class BaseController extends GetxController{

  bool _isLoading = false;
  get isLoading => _isLoading;

  set isLoading(load){
    _isLoading = load;
  }

  Future<void> updateLoadingState({bool isLoading = false}) async{
    _isLoading = isLoading;
    update();
  }

  Future<void> wrappedApiCall<ResponseClass>(Future<ResponseModel> Function() apiCall, Function(ResponseModel response) onSuccess, Function(String message) onFailure) async{
    try{

      ResponseModel responseModel = await apiCall();
      if(responseModel.isSuccess){
        onSuccess(responseModel);
      }else{
        onFailure(responseModel.message);
      }

    }catch(e){
      onFailure(e.toString());
    }
  }



  //Alert display message section

  //show message with empty title
  void showMessage(String title, String msg){
    showSnack(title, msg);
  }

  //show message with empty title
  void showMessageOnly(String msg){
    showSnack('', msg);
  }

  //show error message or default preset message
  void showMessageOrDefault(String? msg){
    showSnack('', msg??StringResources.defaultErrorMsg);
  }

  //Basic snack-bar
  void showSnack(String title, String msg){
    Get.snackbar(title, msg);
  }
}