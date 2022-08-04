import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/logo.dart';
import 'package:getx_russian/core/costants/paddings.dart';
import 'package:getx_russian/view/intro_view/local_widgets/on_boarding_bottom_body.dart';
import 'package:getx_russian/view_model/controllers/intro_controller/on_boarding_controller.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: mainPaddingBody,
        child: Column(
          children: const [
            MainLogo(),
            SizedBox(height: 20.0),
            Text(
              "Load & Lock",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            OnBoardingBottomBody(),
          ],
        ),
      ),
    );
  }
}
