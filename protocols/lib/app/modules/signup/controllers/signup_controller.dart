import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpController extends GetxController {
  RxBool isVisible = false.obs;
  RxDouble visibleH = 15.w.obs;
  RxDouble visibleW = 60.h.obs;
  RxBool errorIsVisible = false.obs;
  RxString errorMesage = 'Oops something wrong! Try again'.obs;
  loadingOn() {
    isVisible.value = true;
    visibleH.value = 10.h;
    visibleW.value = 40.w;
    errorIsVisible.value = false;
    update();
  }

  loadingOff(String message) {
    errorIsVisible.value = true;
    errorMesage.value = message;
    isVisible.value = false;
    visibleH.value = 15.h;
    visibleW.value = 60.w;
    update();
  }

  final signupAppBar = AppBar(
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
            size: 30.w,
            color: const Color(0xff2D9CEA),
          )),
    ),
    actions: [
      Center(
        child: Text(
          'Sign Up',
          style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'Montserrat SemiBold',
              color: Colors.black),
        ),
      ),
      const SizedBox(
        width: 30,
      )
    ],
  );
}
