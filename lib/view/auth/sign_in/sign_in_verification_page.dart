import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/logo.dart';
import 'package:getx_russian/core/costants/paddings.dart';
import 'package:getx_russian/core/routes/app_routes.dart';
import 'package:getx_russian/core/widgets/auth_main_button.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_in/sign_in_sms_verification_controller.dart';

import 'local_widgets/custom_text_field_sms_verification.dart';

class SignInSmsVerificationPage extends StatelessWidget {
  const SignInSmsVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          /// top => logo + sms text field
          Padding(
            padding: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
            child: SingleChildScrollView(
              padding: mainPaddingBodyMax,
              child: Column(
                children: [
                  const MainLogo(),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Verification",
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

          /// bottom => next button
          Container(
            height: Get.height,
            alignment: Alignment.bottomCenter,
            padding: mainPaddingBodyMax,
            margin: EdgeInsets.only(bottom: Get.height * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GetBuilder<SignInSmsVerificationController>(builder: (logic) {
                  return AuthMainButton(
                    text: "Next",
                    onPress: logic.smsController.text.length < 6
                        ? null
                        : () {
                            if (logic.checkSms()) {
                              Get.offAllNamed(AppRoutes.homePage);
                            }
                          },
                  );
                }),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
