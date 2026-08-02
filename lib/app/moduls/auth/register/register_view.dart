import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/auth/register/register_controller.dart';
import 'package:my_flutter_getx_design_pattern/app/widgets/custom_button_widget.dart';
import 'package:my_flutter_getx_design_pattern/app/widgets/custom_input_widget.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        appBar: AppBar(
          title: Text("Register", style: TextStyle(color: Colors.white)),
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
                  controller: controller.firstnameController.value,
                  label: "Firstname", hintText: "Firstname"),
              CustomInputWidget(
                  controller: controller.lastnameController.value,
                  label: "Lastname", hintText: "Lastname"),
              CustomInputWidget(
                  controller: controller.emailController.value,
                  label: "Email", hintText: "Email"),
              CustomInputWidget(
                  controller: controller.phoneNumberController.value,
                  label: "Phone Number", hintText: "Phone Number"),
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
              CustomInputWidget(
                controller: controller.confirmPasswordController.value,
                label: "Confirm Password",
                hintText: "Confirm Password",
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
              CustomInputWidget(
                  controller: controller.roleController.value,
                  label: "Role", hintText: "Role"),
              CustomInputWidget(
                  controller: controller.profileController.value,
                  label: "Profile", hintText: "profile"),
              SizedBox(height: 35,),
              CustomButtonWidget(
                loading: controller.loading.value,
                label: "Register",
                onClick: (){
                  controller.onRegister();

                },

              )

            ],
          ),
        ),
      );
    });
  }
}
