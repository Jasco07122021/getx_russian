import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/colors.dart';
import 'package:getx_russian/core/costants/logo.dart';
import 'package:getx_russian/core/costants/paddings.dart';
import 'package:getx_russian/view/intro_view/local_widgets/choose_language_buttons.dart';

class ChooseLanguagePage extends StatelessWidget {
  const ChooseLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: mainPaddingBody,
        child: Column(
          children: [
            const MainLogo(),
            const SizedBox(height: 20.0),
            const Text(
              "Choose your language",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Get.height * 0.1),
            const ChooseLanguageButtons(
              text: "English",
              colorButton: mainColor,
            ),
            const SizedBox(height: 20.0),
            const ChooseLanguageButtons(
              text: "Hebrew",
              colorButton: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
