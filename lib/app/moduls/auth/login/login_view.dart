import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_input_widget.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        appBar: AppBar(
          title: Text("Login", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputWidget(
                  controller: controller.usernameController.value,
                  label: "Username", hintText: "Username"),
              CustomInputWidget(
                controller: controller.passwordController.value,
                label: "Password",
                hintText: "Password",
                obscureText: controller.isPasswordHidden.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
              SizedBox(height: 35,),
              CustomButtonWidget(
                loading: controller.loading.value,
                label: "login",
                onClick: (){
                  controller.onLogin();
                },
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => Get.toNamed("/register"),
                child: Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      );
    });
  }
}