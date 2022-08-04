import 'package:get/get.dart';
import 'package:getx_russian/view_model/controllers/intro_controller/choose_language_controller.dart';
import 'package:getx_russian/view_model/controllers/intro_controller/on_boarding_controller.dart';

class ChooseLanguageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseLanguageController());
  }
}

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
