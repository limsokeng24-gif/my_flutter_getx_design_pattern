import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cores/models/auth/RegisterResponse.dart';
import '../repository/auth_repository.dart';

class RegisterController extends GetxController {

  final AuthRepository authRepository = Get.find<AuthRepository>();

  var usernameController = TextEditingController().obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;

  var loading = false.obs;

  var hidePassword = true.obs;
  var hideConfirmPassword = true.obs;

  @override
  void onClose() {

    usernameController.value.dispose();
    firstNameController.value.dispose();
    lastNameController.value.dispose();
    emailController.value.dispose();
    phoneController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();

    super.onClose();
  }

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void toggleConfirmPassword() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }


  Future<void> onRegister() async {
    var username = usernameController.value.text;
    var password = passwordController.value.text;
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    var phone = phoneController.value.text;
    var email = emailController.value.text;
    var confirmPassword = confirmPasswordController.value.text;
    print("REGISTER BUTTON CLICKED");

    if (username.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {

      Get.snackbar("Error", "Please fill all fields");
      return;
    }


    if (password != confirmPassword) {

      Get.snackbar("Error", "Passwords do not match");
      return;
    }
    print("VALIDATION PASSED");

    RegisterResponse response = await authRepository.register(
      username: username.trim(),
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      email: email.trim(),
      phoneNumber: phone.trim(),
      password: password,
      confirmPassword: confirmPassword,
      role: "USER",
      profile: "",
    );
    print("REGISTER RESPONSE: ${response.toJson()}");

    if (response.code == "200") {

      Get.snackbar(
        "Create Success",
        response.data ?? "User Open Account successfully",
      );

      Get.offNamed("/login");

    } else {

      Get.snackbar(
        "Error",
        response.message ?? "Register failed",
      );

    }
  }



}