import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/registration_provider.dart';
import 'package:protocols/app/modules/signup/controllers/signup_controller.dart';
import 'package:protocols/app/modules/signup/controllers/text_field_controller.dart';
import 'package:protocols/app/modules/signup/views/sign_up_field_view.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpController().signupAppBar,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 250.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            const SignUpFieldView(),
            SizedBox(
              height: 15.h,
            ),
            Obx(() => (Get.find<SignUpController>().errorIsVisible.value)
                ? Text(
                    Get.find<SignUpController>().errorMesage.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFFD40A0A),
                    ),
                  )
                : const SizedBox()),
            SizedBox(
              height: 15.h,
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
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: () async {
                        if (Get.find<TextFieldController>()
                            .formKey
                            .currentState!
                            .validate()) {
                          Get.find<SignUpController>().loadingOn();
                          final email = Get.find<TextFieldController>()
                              .emailController
                              .text
                              .trim();
                          final password = Get.find<TextFieldController>()
                              .passwordController
                              .text
                              .trim();
                          final firstname = Get.find<TextFieldController>()
                              .firstNameController
                              .text
                              .trim();
                          final lastname = Get.find<TextFieldController>()
                              .lastNameController
                              .text
                              .trim();
                          final companyname = Get.find<TextFieldController>()
                              .companyController
                              .text
                              .trim();
                          final phone = Get.find<TextFieldController>()
                              .phNoController
                              .text
                              .trim();
                          await register(email, password, firstname, lastname,
                              companyname, phone);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical:
                                Get.find<SignUpController>().visibleH.value,
                            horizontal:
                                Get.find<SignUpController>().visibleW.value),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          (Get.find<SignUpController>().isVisible.value)
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
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat Bold',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 50, right: 50),
        child: Row(
          children: [
            Flexible(
              child: Text.rich(
                TextSpan(
                  text: 'By continuing you Agree to Accept our ',
                  style: TextStyle(fontSize: 14.sp),
                  children: <InlineSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.HOME);
                        },
                      text: 'T&C ',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat Bold',
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1E7CE4)),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.HOME);
                        },
                      text: 'Privacy Policy \n',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat Bold',
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1E7CE4)),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
