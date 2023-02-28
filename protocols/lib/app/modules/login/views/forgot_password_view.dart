import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/login_provider.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/login/controllers/login_controller.dart';
import 'package:protocols/app/modules/login/controllers/login_field_controller.dart';

class ForgotPasswordView extends GetView<LoginFieldController>
    with InputValidationMixin {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginController().forgotPassAppBar,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'Montserrat Bold',
                fontSize: 20.sp,
                letterSpacing: 1,
                color: const Color(0xFF1E90E2),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Fill up the form below with your registered email address. We will revert back to the provided email with a link to reset your password.',
              style: TextStyle(
                  fontFamily: 'Montserrat Medium',
                  fontSize: 12.sp,
                  color: Colors.grey[600]),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
              key: Get.find<LoginFieldController>().formKeyReset,
              child: TextFormField(
                controller:
                    Get.find<LoginFieldController>().resetEmailController,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Email is required!";
                  } else if (!isEmailValid(value)) {
                    return "Invalid email! Enter valid email";
                  } else {
                    return null;
                  }
                }),
                keyboardType: TextInputType.emailAddress,
                decoration: Get.find<LoginFieldController>().resetEmailDeco,
                cursorColor: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            Obx(() => (Get.find<LoginController>().resetErrorIsVisible.value)
                ? Text(
                    Get.find<LoginController>().resetErrorMesage.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFFD40A0A),
                    ),
                  )
                : const SizedBox()),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 52, 52, 52)
                              .withOpacity(0.4),
                          spreadRadius: .5,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: () {
                        if (Get.find<LoginFieldController>()
                            .formKeyReset
                            .currentState!
                            .validate()) {
                          final email = Get.find<LoginFieldController>()
                              .resetEmailController
                              .text
                              .trim()
                              .toLowerCase();
                          LoginProvider().resetPassword(email, context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: 14.h, horizontal: 28.w),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          (Get.find<LoginController>().loading.value)
                              ? Transform.scale(
                                  scale: 0.8,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 15.w),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 1.5,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Text(
                            'Send Mail',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Montserrat Bold',
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          const Icon(Icons.arrow_right_alt_rounded)
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.only(right: 10.w),
      //   child: Container(
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(12),
      //         gradient: const LinearGradient(
      //             colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
      //             begin: Alignment.topCenter,
      //             end: Alignment.bottomCenter)),
      //     child: TextButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       style: ElevatedButton.styleFrom(
      //           shadowColor: Colors.transparent,
      //           padding: EdgeInsets.all(10.w),
      //           minimumSize: Size.zero,
      //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10))),
      //       child: Icon(
      //         Icons.check_rounded,
      //         color: Colors.white,
      //         size: 30.h,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
