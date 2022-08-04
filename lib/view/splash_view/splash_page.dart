import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/logo.dart';
import 'package:getx_russian/core/routes/app_routes.dart';
import 'package:getx_russian/view_model/controllers/splash_controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<SplashController>(
          builder: (logic) => AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: logic.opacity,
            onEnd: () async {
              await logic.isNavigate().then((value) {
                Get.offNamed(AppRoutes.chooseLanguage);
              });
            },
            child: const MainLogo(),
          ),
        ),
      ),
    );
  }
}
