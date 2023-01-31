import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:protocols/app/routes/app_pages.dart';

class PaymentSuccessView extends GetView {
  const PaymentSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            physics: const BouncingScrollPhysics(),
            children: [
              Lottie.network(
                  'https://assets6.lottiefiles.com/packages/lf20_iTqn3b1QrG.json',
                  height: 120.h,
                  repeat: false,
                  animate: true),
              // SizedBox(
              //   height: 25.h,
              //   child: Image.asset(
              //     'assets/images/logo.png',
              //     width: 60.w,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Successful',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Montserrat Bold',
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  'Your payment was done successfuly',
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                style: ElevatedButton.styleFrom(
                    //  backgroundColor: const Color(0xff2B6EFB),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.w))),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    letterSpacing: .9,
                    fontFamily: 'Montserrat Bold',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
