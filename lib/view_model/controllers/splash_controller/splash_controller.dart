import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  double opacity = 0;
  late Timer timerOpacity;

  @override
  void onInit() {
    timerOpacity = Timer(const Duration(milliseconds: 500), () {
      opacity = 1;
      update();
    });
    super.onInit();
  }

  Future<void> isNavigate() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void onClose() {
    timerOpacity.cancel();
    super.onClose();
  }
}
