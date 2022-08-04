import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/colors.dart';
import 'package:getx_russian/core/costants/styles.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_in/sign_in_sms_verification_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomTextFieldSignInPhoneNumber extends StatelessWidget {
  const CustomTextFieldSignInPhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Text("Enter SMS", style: textFieldHeaderTextStyle),
          const SizedBox(height: 10.0),
          GetBuilder<SignInSmsVerificationController>(
            builder: (logic) {
              return PinCodeTextField(
                controller: logic.smsController,
                errorAnimationController: logic.errorController,
                appContext: context,
                length: 6,
                onChanged: (v) {
                  logic.update();
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10.0),
                  fieldHeight: 56,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  activeColor: mainColor,
                  selectedColor: mainColor,
                  inactiveColor: textFieldBorderColor,
                ),
                cursorColor: mainColor,
              );
            },
          ),
          GetBuilder<SignInSmsVerificationController>(builder: (logic) {
            return RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                text: "Re-send code in  ",
                children: [
                  TextSpan(
                    text: logic.sec == 0 ? "Recent" : "0:${logic.sec}",
                    style: const TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        logic.richTextOnPress();
                      },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
