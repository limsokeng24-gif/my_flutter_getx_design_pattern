import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> HomeController());
  }

}