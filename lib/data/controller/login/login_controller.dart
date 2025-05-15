
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/core/utils/string_resources.dart';
import 'package:flutter_app_template/data/controller/base/base_controller.dart';
import 'package:flutter_app_template/data/model/login/login_response_model.dart';
import 'package:flutter_app_template/data/repo/login/login_repo.dart';

class LoginController extends BaseController{

  final LoginRepo loginRepo;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obSecureText = false;

  LoginController({required this.loginRepo});

  //login request
  Future<void> requestLogin({required void Function() onSuccess, void Function(String errorMessage)? onFailure}) async{
    if(isValid()){
      safeApiCall(() {
        return loginRepo.requestLogin(usernameController.text.trim(), passwordController.text.trim());
      }, (response) {
        LoginResponseModel loginResponse = LoginResponseModel.fromJson(jsonDecode(response.data));

        //do login saving here...

        onSuccess();
      }, (message) {
        if(onFailure!=null){
          onFailure(message);
        }
        showMessageOnly(message);
      },);
    }
  }

  //input validation
  bool isValid(){

    if(usernameController.text.isEmpty){
      showMessageOnly(StringResources.enterUsername);
      return false;
    }
    if(passwordController.text.isEmpty){
      showMessageOnly(StringResources.enterPassword);
      return false;
    }

    // more checks here
    return true;
  }

  void togglePassVisibility(){
    obSecureText = !obSecureText;
    update();
  }

}