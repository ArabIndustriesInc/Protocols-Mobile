import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginController extends GetxController {
  RxString errorMesage = 'Oops wrong Email or Password! Try again'.obs;
  RxString resetErrorMesage = 'Oops wrong Email! Try again'.obs;
  RxBool isVisible = false.obs;
  RxDouble visibleH = 16.w.obs;
  RxDouble visibleW = 60.h.obs;
  RxBool errorIsVisible = false.obs;
  RxBool resetErrorIsVisible = false.obs;
  var loading = false.obs;

  visibleOn() {
    isVisible.value = true;
    visibleH.value = 10.h;
    visibleW.value = 40.w;
    errorIsVisible.value = false;
    update();
  }

  resetPassErrorOn(String message) {
    resetErrorMesage.value = message;
    update();
  }

  visibleOff(String message) {
    errorMesage.value = message;
    errorIsVisible.value = true;
    isVisible.value = false;
    visibleH.value = 15.h;
    visibleW.value = 60.w;
    update();
  }

  final loginAppBar = AppBar(
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
          'Login',
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
        ),
      ),
      const SizedBox(
        width: 35,
      )
    ],
  );
  final forgotPassAppBar = AppBar(
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
          'Reset Password',
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
        ),
      ),
      const SizedBox(
        width: 35,
      )
    ],
  );
}
