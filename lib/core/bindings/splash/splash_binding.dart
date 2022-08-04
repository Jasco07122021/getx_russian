import 'package:get/get.dart';
import 'package:getx_russian/view_model/controllers/splash_controller/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}