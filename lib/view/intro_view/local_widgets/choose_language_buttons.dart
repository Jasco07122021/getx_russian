import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/routes/app_routes.dart';

import '../../../core/costants/colors.dart';

class ChooseLanguageButtons extends StatelessWidget {
  final String text;
  final Color colorButton;

  const ChooseLanguageButtons({
    Key? key,
    required this.text,
    required this.colorButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 55.0,
      textColor: colorButton == mainColor ? Colors.white : mainColor,
      color: colorButton,
      elevation: 0.5,
      shape: const StadiumBorder(
        side: BorderSide(color: mainColor),
      ),
      onPressed: () {
        Get.offNamed(AppRoutes.onBoardingView);
      },
      child: Text(text),
    );
  }
}
