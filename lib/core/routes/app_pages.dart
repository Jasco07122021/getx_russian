import 'package:get/get.dart';
import 'package:getx_russian/core/bindings/auth/sign_in_bindings.dart';
import 'package:getx_russian/core/bindings/auth/sign_up_bindings.dart';
import 'package:getx_russian/core/bindings/home/home_bindings.dart';
import 'package:getx_russian/view/auth/sign_in/sign_in_phone_number_page.dart';
import 'package:getx_russian/view/auth/sign_in/sign_in_verification_page.dart';
import 'package:getx_russian/view/auth/sign_up/sign_up_page.dart';
import 'package:getx_russian/view/home/home_page.dart';
import 'package:getx_russian/view/intro_view/choose_language_page.dart';
import 'package:getx_russian/view/intro_view/on_boarding_page.dart';
import 'package:getx_russian/view/splash_view/splash_page.dart';

import '../bindings/intro/intro_bindings.dart';
import '../bindings/splash/splash_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.chooseLanguage,
      page: () => const ChooseLanguagePage(),
      binding: ChooseLanguageBindings(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.onBoardingView,
      page: () => const OnBoardingPage(),
      binding: OnBoardingBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.authPhoneNumber,
      page: () => const SignInPhoneNumberPage(),
      binding: SignInPhoneNumberBindings(),
    ),
    GetPage(
      name: AppRoutes.authSmsVerification,
      page: () => const SignInSmsVerificationPage(),
      binding: SignInSmsVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.authSignUp,
      page: () => const SignUpPage(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
