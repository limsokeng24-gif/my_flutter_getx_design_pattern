import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_getx_design_pattern/app/data/access_token.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/auth/repository/auth_repository.dart';

class RegisterController extends GetxController {
  var usernameController = TextEditingController().obs;
  var firstnameController = TextEditingController().obs;
  var lastnameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var roleController = TextEditingController().obs;
  var profileController = TextEditingController().obs;
  var loading = false.obs;
  var isPasswordHidden = true.obs;
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onClose() {
    usernameController.value.dispose();
    firstnameController.value.dispose();
    lastnameController.value.dispose();
    emailController.value.dispose();
    phoneNumberController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    roleController.value.dispose();
    profileController.value.dispose();
    super.onClose();
  }

  Future<void> onRegister() async {
    var username = usernameController.value.text;
    var firstname = firstnameController.value.text;
    var lastname = lastnameController.value.text;
    var email = emailController.value.text;
    var phonenumber = phoneNumberController.value.text;
    var password = passwordController.value.text;
    var confirmpassword = confirmPasswordController.value.text;
    var role = roleController.value.text;
    var profile = profileController.value.text;
    if (username.isEmpty) {
      Get.snackbar("Error", "Username is required");
      return;
    }
    if (firstname.isEmpty) {
      Get.snackbar("Error", "Firstname is required");
      return;
    }
    if (lastname.isEmpty) {
      Get.snackbar("Error", "Lastname is required");
      return;
    }
    if (email.isEmpty) {
      Get.snackbar("Error", "Email is required");
      return;
    }

    if (password.isEmpty) {
      Get.snackbar(("Error"), "Password is required");
      return;
    }
    if (confirmpassword.isEmpty) {
      Get.snackbar("Error", "ConfirmPassword is required");
      return;
    }
    if (password != confirmpassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }
    loading.value = true;
    await Future.delayed(Duration(seconds: 3));
    loading.value = false;
    AccessToken.saveToken(
      username: username,
      token: "TOKEN",
      refresh: "REFRESH",
    );
    Get.offNamed("/home");
  }
}
