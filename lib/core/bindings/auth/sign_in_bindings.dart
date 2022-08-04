import 'package:get/get.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_in/sign_in_phone_number_controller.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_in/sign_in_sms_verification_controller.dart';

class SignInPhoneNumberBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInPhoneNumberController());
  }
}

class SignInSmsVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInSmsVerificationController());
  }
}
