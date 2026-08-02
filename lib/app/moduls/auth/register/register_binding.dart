import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/auth/login/login_controller.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/auth/register/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> RegisterController());
  }

}