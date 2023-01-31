import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/otp_verify_provider.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/otp-verify/controllers/otp_controller.dart';
import 'package:protocols/app/modules/otp-verify/controllers/otp_verify_controller.dart';
import 'package:protocols/app/modules/otp-verify/views/otp_keypad_view.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtpController().otpAppBar,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
              ),
              Center(
                child: Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFF14AEF0),
                    letterSpacing: .9,
                    fontFamily: 'Montserrat Black',
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'An OTP has been send to your email id. Enter it to proceed further!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OTPField(
                    textController:
                        Get.find<OtpVerifyController>().otpOneController,
                  ),
                  OTPField(
                    textController:
                        Get.find<OtpVerifyController>().otpTwoController,
                  ),
                  OTPField(
                    textController:
                        Get.find<OtpVerifyController>().otpThreeController,
                  ),
                  OTPField(
                    textController:
                        Get.find<OtpVerifyController>().otpFourController,
                  ),
                  OTPField(
                    textController:
                        Get.find<OtpVerifyController>().otpFiveController,
                  ),
                  OTPField(
                    textController:
                        Get.find<OtpVerifyController>().otpSixController,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => (Get.find<OtpVerifyController>().verify.value)
                    ? Text(
                        'Oops! OTP does not match!',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 14.sp, color: Colors.red[400]),
                      )
                    : (Get.find<OtpVerifyController>().buffer.value)
                        ? Transform.scale(
                            scale: 0.8,
                            child: Padding(
                              padding: EdgeInsets.all(10.h),
                              child: const CircularProgressIndicator(
                                color: Color(0xFF14AEF0),
                              ),
                            ),
                          )
                        : const SizedBox(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text.rich(
                TextSpan(
                  text: 'Didn\'t recieve the code? ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Montserrat Bold',
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          resendOtp();
                          SnackbarMessage().snackBarMessage(
                              'OTP resend successfully!', context);
                        },
                      text: 'Resend',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat Bold',
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0561AC),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SizedBox()),
              const OtpKeypadView(),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.only(
      //     right: 10.w,
      //   ),
      //   child: const NotesButtonView(),
      // ),
    );
  }
}
