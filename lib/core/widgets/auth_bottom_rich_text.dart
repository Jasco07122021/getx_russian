import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/routes/app_routes.dart';

class AuthBottomRichText extends StatelessWidget {
  final String simpleText;
  final String richText;

  const AuthBottomRichText({
    Key? key,
    required this.richText,
    required this.simpleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$simpleText ",
        style: const TextStyle(color: Colors.black, fontSize: 16.0),
        children: [
          TextSpan(
            text: richText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (richText == "Sign up") {
                  Get.offAllNamed(AppRoutes.authSignUp);
                } else {
                  Get.offAllNamed(AppRoutes.authPhoneNumber);
                }
              },
          ),
        ],
      ),
    );
  }
}
