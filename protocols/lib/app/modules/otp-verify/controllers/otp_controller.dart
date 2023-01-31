import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/otp-verify/controllers/otp_verify_controller.dart';

class OtpController extends GetxController {
  final otpAppBar = AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.west_rounded,
            size: 32.h,
            color: const Color(0xFF14AEF0),
          )),
    ),
    actions: [
      Center(
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
        ),
      ),
      SizedBox(
        width: 35.h,
      )
    ],
  );
}

class OTPField extends GetView {
  final TextEditingController textController;
  const OTPField({Key? key, required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: TextField(
          controller: textController,
          enabled: false,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.h),
            border: Get.find<OtpVerifyController>().outlineInputBorder,
            filled: true,
            fillColor: const Color(0xFFF2F4F8).withOpacity(.7),
          ),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Colors.black),
        ),
      ),
    );
  }
}

class KeyboardNumber extends GetView {
  final int n;
  final Function() onPressed;
  const KeyboardNumber({Key? key, required this.n, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF2F4F8).withOpacity(.6),
      ),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(15.h),
          shape: const CircleBorder(),
        ),
        child: Text(
          n.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20 * MediaQuery.of(context).textScaleFactor,
              // color: const Color(0xFF0561AC),
              color: Colors.black),
        ),
      ),
    );
  }
}
