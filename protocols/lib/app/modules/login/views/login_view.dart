import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/login_provider.dart';
import 'package:protocols/app/modules/login/controllers/login_controller.dart';
import 'package:protocols/app/modules/login/controllers/login_field_controller.dart';
import 'package:protocols/app/modules/login/views/login_field_view.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginController().loginAppBar,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10.h,
            ),
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 274.h,
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/login.png',
              height: 210.h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const LoginFieldView(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 55,
            ),
            Obx(() => (Get.find<LoginController>().errorIsVisible.value)
                ? Text(
                    Get.find<LoginController>().errorMesage.value,
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
                      onPressed: () {
                        if (Get.find<LoginFieldController>()
                            .formKeyLogin
                            .currentState!
                            .validate()) {
                          Get.find<LoginController>().visibleOn();
                          final email = Get.find<LoginFieldController>()
                              .emailController
                              .text
                              .trim()
                              .toLowerCase();
                          final password = Get.find<LoginFieldController>()
                              .passwordController
                              .text
                              .trim();
                          login(email, password, context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical:
                                Get.find<LoginController>().visibleH.value,
                            horizontal:
                                Get.find<LoginController>().visibleW.value),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          (Get.find<LoginController>().isVisible.value)
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
                            'Sign In',
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
              height: 15.h,
            ),
            Text.rich(
              TextSpan(
                text: '',
                children: <InlineSpan>[
                  TextSpan(
                    text: 'New User? ',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                    text: 'Create Account',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat Bold',
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1E7CE4)),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
