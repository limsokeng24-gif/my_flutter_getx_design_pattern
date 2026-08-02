import 'package:get/get.dart';
import 'package:my_flutter_getx_design_pattern/app/moduls/post/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PostController());
  }

}