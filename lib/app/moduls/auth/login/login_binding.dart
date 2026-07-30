import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/auth/login/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> LoginController());
  }

}