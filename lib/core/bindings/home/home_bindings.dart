import 'package:get/get.dart';
import 'package:getx_russian/view_model/controllers/home_controller/home_page_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController(), fenix: true);
  }
}
