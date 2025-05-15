import 'package:flutter/material.dart';
import 'package:flutter_app_template/data/controller/login/login_controller.dart';
import 'package:flutter_app_template/data/repo/login/login_repo.dart';
import 'package:flutter_app_template/view/components/loading_widget.dart';
import 'package:flutter_app_template/view/screens/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => LoginRepo(apiService: Get.find()));
    Get.lazyPut(() => LoginController(loginRepo: Get.find()));

    Get.find<LoginController>()
      ..usernameController.text = 'emilys1'
      ..passwordController.text = 'emilyspass';

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<LoginController>(
            builder: (loginController) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: loginController.usernameController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: loginController.passwordController,
                    obscureText: loginController.obSecureText,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          (loginController.obSecureText)
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          loginController.togglePassVisibility();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if(!loginController.isLoading)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.requestLogin(
                          onSuccess: () {
                            Get.off(()=>DashboardScreen());
                          },
                          onFailure: (error) {

                          },
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  if(loginController.isLoading)
                    const LoadingWidget()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
