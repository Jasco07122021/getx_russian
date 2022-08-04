import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/logo.dart';
import 'package:getx_russian/core/costants/paddings.dart';
import 'package:getx_russian/core/routes/app_routes.dart';
import 'package:getx_russian/core/widgets/auth_bottom_rich_text.dart';
import 'package:getx_russian/core/widgets/auth_main_button.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_up/sign_up_controller.dart';

import 'local_widgets/custom_text_field.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          /// top => logo + text field phone
          SingleChildScrollView(
            padding: mainPaddingBodyMax,
            child: Column(
              children: [
                const MainLogo(),
                const SizedBox(height: 20.0),
                const Text(
                  "Registration",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                const CustomTextFieldSignUp(
                  mainText: "Full Name",
                  icon: CupertinoIcons.person,
                  textInputType: TextInputType.text,
                  errorText: "Check full name",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomTextFieldSignUp(
                    mainText: "Phone number",
                    icon: CupertinoIcons.phone,
                    textInputType: TextInputType.number,
                    errorText: "Phone number needs to be in 10 digits",
                  ),
                ),
                const CustomTextFieldSignUp(
                  mainText: "Email",
                  icon: CupertinoIcons.mail,
                  textInputType: TextInputType.emailAddress,
                  errorText: "Check email",
                ),
              ],
            ),
          ),

          /// bottom => button + rich text
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Container(
              height: Get.height,
              alignment: Alignment.bottomCenter,
              padding: mainPaddingBodyMax,
              margin: EdgeInsets.only(bottom: Get.height * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AuthMainButton(
                    text: "Sign up",
                    onPress: () {
                      bool success = controller.checkFieldIsSuccess();
                      if (success) Get.offAllNamed(AppRoutes.homePage);
                    },
                  ),
                  const SizedBox(height: 15.0),
                  const AuthBottomRichText(
                    simpleText: "Already have an account?",
                    richText: "Sign in",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

