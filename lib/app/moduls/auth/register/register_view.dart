import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_input_widget.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text("Register"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomInputWidget(
                        controller: controller.firstNameController.value,
                        label: "First Name",
                        hintText: "First Name",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomInputWidget(
                        controller: controller.lastNameController.value,
                        label: "Last Name",
                        hintText: "Last Name",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomInputWidget(
                  controller: controller.usernameController.value,
                  label: "Username",
                  hintText: "Username",
                ),
                const SizedBox(height: 16),
                CustomInputWidget(
                  controller: controller.emailController.value,
                  label: "Email",
                  hintText: "Email",
                ),
                const SizedBox(height: 16),
                CustomInputWidget(
                  controller: controller.phoneController.value,
                  label: "Phone Number",
                  hintText: "Phone Number",
                ),
                const SizedBox(height: 16),
                CustomInputWidget(
                  controller: controller.passwordController.value,
                  label: "Password",
                  hintText: "Password",
                  obscureText: controller.hidePassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: controller.togglePassword,
                  ),
                ),
                const SizedBox(height: 16),
                CustomInputWidget(
                  controller: controller.confirmPasswordController.value,
                  label: "Confirm Password",
                  hintText: "Confirm Password",
                  obscureText: controller.hideConfirmPassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hideConfirmPassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: controller.toggleConfirmPassword,
                  ),
                ),
                const SizedBox(height: 35),
                CustomButtonWidget(
                  loading: controller.loading.value,
                  label: "Register",
                  onClick: () {
                    controller.onRegister();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}