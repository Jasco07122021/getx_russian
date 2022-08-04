import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  int isFirstHeaderText = 0;
  PageController pageController = PageController(initialPage: 0);
  late Timer timer;

  void updateHeaderText(int index) {
    isFirstHeaderText = index;
    update();
  }

  void updatePageViewController() {
    if (pageController.page != 1) {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
