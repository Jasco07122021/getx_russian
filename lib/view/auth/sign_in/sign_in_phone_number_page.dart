import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/logo.dart';
import 'package:getx_russian/core/costants/paddings.dart';
import 'package:getx_russian/core/routes/app_routes.dart';
import 'package:getx_russian/core/widgets/auth_bottom_rich_text.dart';
import 'package:getx_russian/core/widgets/auth_main_button.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_in/sign_in_phone_number_controller.dart';

import 'local_widgets/custom_text_field_phone.dart';

class SignInPhoneNumberPage extends GetView<SignInPhoneNumberController> {
  const SignInPhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          /// top => logo + text field phone
          Padding(
            padding: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
            child: SingleChildScrollView(
              padding: mainPaddingBodyMax,
              child: Column(
                children: [
                  const MainLogo(),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Auth",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.1),
                  const CustomTextFieldSignInPhoneNumber(),
                ],
              ),
            ),
          ),

          /// bottom => button + rich text
          Container(
            height: Get.height,
            alignment: Alignment.bottomCenter,
            padding: mainPaddingBodyMax,
            margin: EdgeInsets.only(bottom: Get.height * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthMainButton(
                  text: "Sign in",
                  onPress: () {
                    bool isSuccess = controller.checkIsPhoneNumberSuccess();
                    if (isSuccess) {
                      Get.toNamed(AppRoutes.authSmsVerification);
                    }
                  },
                ),
                const SizedBox(height: 15.0),
                const AuthBottomRichText(
                  simpleText: "Don’t have account?",
                  richText: "Sign up",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
