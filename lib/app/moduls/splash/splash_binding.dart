import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/splash/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> SplashController());
  }

}