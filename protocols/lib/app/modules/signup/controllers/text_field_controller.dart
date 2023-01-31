import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final firstNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'First Name',
      hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final lastNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Last Name',
      hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final phNoDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Phone Number',
      hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final emailDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Email Address',
      hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final companyDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Company Name',
      hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final passwordDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Password',
      hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
  final confirmPasswordDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Confirm Password',
      hintStyle: TextStyle(
        fontSize: 12.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
}
