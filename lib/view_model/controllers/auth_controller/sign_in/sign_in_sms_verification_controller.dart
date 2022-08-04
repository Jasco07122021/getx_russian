import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignInSmsVerificationController extends GetxController {
  TextEditingController smsController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  late Timer timer;
  int sec = 60;

  bool hasError = false;

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    startTimer();
    super.onInit();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (sec <= 0) {
          timer.cancel();
        } else {
          sec = sec - 1;
        }
        update();
      },
    );
  }

  void richTextOnPress() {
    if (sec == 0) {
      smsController.clear();
      sec = 60;
      update();
      startTimer();
    }
  }

  bool checkSms() {
    if (smsController.text != "111111") {
      errorController!.add(ErrorAnimationType.shake);
      hasError = true;
      update();
      return false;
    }

    if (hasError) {
      hasError = false;
      update();
    }
    return true;
  }

  @override
  void onClose() {
    errorController!.close();
    timer.cancel();
    super.onClose();
  }
}
