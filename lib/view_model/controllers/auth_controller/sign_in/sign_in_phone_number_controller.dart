import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInPhoneNumberController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  bool isError = false;

  bool checkIsPhoneNumberSuccess() {
    String? text = phoneNumberController.text.trim();
    if (text.length != 18) {
      isError = true;
      update();
      return false;
    }
    if (isError) {
      isError = false;
      update();
    }
    return true;
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
