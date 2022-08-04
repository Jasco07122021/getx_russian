import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/colors.dart';
import 'package:getx_russian/core/costants/styles.dart';
import 'package:getx_russian/core/widgets/phone_mask.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_up/sign_up_controller.dart';

class CustomTextFieldSignUp extends GetView<SignUpController> {
  final String mainText;
  final String errorText;
  final IconData icon;
  final TextInputType textInputType;

  const CustomTextFieldSignUp({
    Key? key,
    required this.icon,
    required this.mainText,
    required this.errorText,
    required this.textInputType,
  }) : super(key: key);

  TextEditingController switchController() {
    if (mainText == "Full Name") {
      return controller.fullNameController;
    } else if (mainText == "Phone number") {
      return controller.phoneNameController;
    }
    return controller.emailController;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mainText, style: textFieldHeaderTextStyle),
          const SizedBox(height: 10.0),
          GetBuilder<SignUpController>(builder: (logic) {
            return TextField(
              controller: switchController(),
              decoration: InputDecoration(
                hintText: mainText,
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                prefixIcon: Icon(icon),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: textFieldBorderColor),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                errorText: logic.checkIsErrorText(switchController().text,
                    mainText == "Phone number", mainText == "Email")
                    ? errorText
                    : null,
              ),
              inputFormatters: [
                if (mainText == "Phone number") PhoneMask.maskPhoneNumber
              ],
              keyboardType: textInputType,
              onChanged: (v) => controller.update(),
            );
          }),
        ],
      ),
    );
  }
}
