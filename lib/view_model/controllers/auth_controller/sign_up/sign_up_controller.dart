import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isError = false;

  bool checkFieldIsSuccess() {
    String? fullName = fullNameController.text.trim();
    String? phoneName = phoneNameController.text.trim();
    String? email = emailController.text.trim();

    if (fullName.isEmpty ||
        phoneName.isEmpty ||
        email.isEmpty ||
        phoneName.length != 18 ||
        !email.isEmail) {
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

  bool checkIsErrorText(
    String text,
    bool isNumber,
    bool isEmail,
  ) {
    if (isError &
        (text.isEmpty ||
            (isNumber && text.length != 18) ||
            (isEmail && !text.isEmail))) {
      return true;
    }
    return false;
  }
}
