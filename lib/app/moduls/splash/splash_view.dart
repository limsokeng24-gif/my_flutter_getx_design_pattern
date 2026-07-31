import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.cyan,
        body: controller.loading.value == false
            ? Center()
            : Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    });
  }
}
