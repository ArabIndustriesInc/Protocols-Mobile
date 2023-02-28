import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFieldController extends GetxController {
  GlobalKey<FormState> formKeyLogin = GlobalKey();
  GlobalKey<FormState> formKeyReset = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController resetEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginEmailDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 23.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'Email Address',
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final resetEmailDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'Email Address',
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final loginPassDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: border,
      errorBorder: border,
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 23.h),
      focusedBorder: border,
      enabledBorder: border,
      hintText: 'Password',
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
}

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
);
