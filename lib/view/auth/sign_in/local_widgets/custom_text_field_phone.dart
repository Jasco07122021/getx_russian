import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_russian/core/costants/colors.dart';
import 'package:getx_russian/core/costants/styles.dart';
import 'package:getx_russian/core/widgets/phone_mask.dart';
import 'package:getx_russian/view_model/controllers/auth_controller/sign_in/sign_in_phone_number_controller.dart';

class CustomTextFieldSignInPhoneNumber
    extends GetView<SignInPhoneNumberController> {
  const CustomTextFieldSignInPhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Phone number", style: textFieldHeaderTextStyle),
          const SizedBox(height: 10.0),
          GetBuilder<SignInPhoneNumberController>(
            builder: (logic) {
              return TextField(
                controller: logic.phoneNumberController,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                  prefixIcon: const Icon(CupertinoIcons.phone),
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
                  errorText: logic.isError &&
                          logic.phoneNumberController.text.length != 18
                      ? "Check Phone number"
                      : null,
                ),
                inputFormatters: [PhoneMask.maskPhoneNumber],
                keyboardType: TextInputType.number,
                onChanged: (v) => logic.update(),
              );
            },
          ),
        ],
      ),
    );
  }
}
