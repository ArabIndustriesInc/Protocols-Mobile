import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/otp-verify/controllers/otp_controller.dart';
import 'package:protocols/app/modules/otp-verify/controllers/otp_verify_controller.dart';

class OtpKeypadView extends GetView<OtpVerifyController> {
  const OtpKeypadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KeyboardNumber(
                n: 1,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("1");
                }),
            KeyboardNumber(
                n: 2,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("2");
                }),
            KeyboardNumber(
                n: 3,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("3");
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KeyboardNumber(
                n: 4,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("4");
                }),
            KeyboardNumber(
                n: 5,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("5");
                }),
            KeyboardNumber(
                n: 6,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("6");
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KeyboardNumber(
                n: 7,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("7");
                }),
            KeyboardNumber(
                n: 8,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("8");
                }),
            KeyboardNumber(
                n: 9,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("9");
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 50.w,
            ),
            KeyboardNumber(
                n: 0,
                onPressed: () {
                  Get.find<OtpVerifyController>().otpIndexNo("0");
                }),
            IconButton(
                onPressed: () {
                  Get.find<OtpVerifyController>().clearOTP();
                },
                icon: const Icon(Icons.backspace_rounded)),
          ],
        )
      ],
    );
  }
}
