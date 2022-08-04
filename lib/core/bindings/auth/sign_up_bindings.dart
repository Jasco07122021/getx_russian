import 'package:get/get.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_up/sign_up_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
