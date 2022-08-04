import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/colors.dart';
import 'package:getx_russian/core/routes/app_routes.dart';
import 'package:getx_russian/view_model/controllers/intro_controller/on_boarding_controller.dart';

class OnBoardingBottomBody extends GetView<OnBoardingController> {
  const OnBoardingBottomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.4,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
      ),
      child: Column(
        children: [
          /// header text
          Expanded(
            child: GetBuilder<OnBoardingController>(
              builder: (logic) => AnimatedCrossFade(
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 50),
                firstChild: const Text(
                  "Have you ever known?",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
                secondChild: const Text(
                  "Charge without troubles",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
                crossFadeState: logic.isFirstHeaderText == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),

          /// middle text
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.updateHeaderText(index);
              },
              children: const [
                MiddleText(
                    text:
                        "If battery stays in unsuitable conditions, it can be broken"),
                MiddleText(
                    text:
                        "In Load&Lock you can rent safe lockers for storage and charging battery"),
              ],
            ),
          ),

          /// bottom skip + next
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkipNextButtons(
                    text: "Skip",
                    onPress: () {
                      Get.offNamed(AppRoutes.authPhoneNumber);
                    }),
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _circleAvatar(0),
                      const SizedBox(width: 5.0),
                      _circleAvatar(1),
                    ],
                  ),
                ),
                SkipNextButtons(
                  text: "Next",
                  onPress: () {
                    controller.updatePageViewController();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GetBuilder _circleAvatar(int index) {
    return GetBuilder<OnBoardingController>(builder: (logic) {
      bool isActive = logic.isFirstHeaderText == index;
      return CircleAvatar(
        radius: isActive ? 3.5 : 3,
        backgroundColor: isActive ? Colors.white : Colors.grey,
      );
    });
  }
}

class MiddleText extends StatelessWidget {
  final String text;

  const MiddleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SkipNextButtons extends StatelessWidget {
  final String text;
  final Function()? onPress;

  const SkipNextButtons({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (logic) {
        bool skipIsActive = logic.isFirstHeaderText == 1;
        bool isSkip = text == "Skip";
        return TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: skipIsActive
              ? isSkip
                  ? onPress
                  : null
              : isSkip
                  ? null
                  : onPress,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
              color: skipIsActive
                  ? isSkip
                      ? Colors.white
                      : Colors.white.withOpacity(0.7)
                  : isSkip
                      ? Colors.white.withOpacity(0.7)
                      : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
