import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/colors.dart';

class AuthMainButton extends StatelessWidget {
  final String text;
  final Function()? onPress;

  const AuthMainButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: mainColor,
      textColor: Colors.white,
      height: Get.height * 0.06,
      minWidth: double.infinity,
      shape: const StadiumBorder(),
      onPressed: onPress,
      disabledColor: Colors.grey.shade200,
      disabledTextColor: Colors.black,
      child: Text(text),
    );
  }
}
