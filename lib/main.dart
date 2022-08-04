import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/splash/splash_binding.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: SplashBindings(),
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
    );
  }
}
