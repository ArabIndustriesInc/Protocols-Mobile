import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/otp_verify_provider.dart';

class OtpVerifyController extends GetxController {
  RxBool verify = false.obs;
  RxBool buffer = false.obs;
  List<String> currentotp = ["", "", "", "", "", ""];
  TextEditingController otpOneController = TextEditingController();
  TextEditingController otpTwoController = TextEditingController();
  TextEditingController otpThreeController = TextEditingController();
  TextEditingController otpFourController = TextEditingController();
  TextEditingController otpFiveController = TextEditingController();
  TextEditingController otpSixController = TextEditingController();
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Color(0xFFF2F4F8), width: .8),
  );
  int otpIndex = 0;
  setOTP(int n, String no) {
    switch (n) {
      case 1:
        otpOneController.text = no;
        break;
      case 2:
        otpTwoController.text = no;
        break;
      case 3:
        otpThreeController.text = no;
        break;
      case 4:
        otpFourController.text = no;
        break;
      case 5:
        otpFiveController.text = no;
        break;
      case 6:
        otpSixController.text = no;
        break;
      default:
    }
  }

  otpIndexNo(String no) {
    // if (otpIndex == 0) {
    //   otpIndex = 1;
    // } else
    if (otpIndex < 6) {
      otpIndex++;
      setOTP(otpIndex, no);
      currentotp[otpIndex - 1] = no;
      String strOTP = "";
      for (var element in currentotp) {
        strOTP += element;
      }
      if (otpIndex == 6) {
        otpVerify(strOTP);
        buffer.value = true;
        // for (var i = 0; i < 6; i++) {
        //   if (otpIndex == 0) {
        //     otpIndex == 0;
        //     verify.value = false;
        //   } else {
        //     setOTP(otpIndex, "");
        //     currentotp[otpIndex - 1];
        //     otpIndex--;
        //     verify.value = false;
        //   }
        // }
        // strOTP = '';
      }
    }
  }

  clearOTP() {
    if (otpIndex == 0) {
      otpIndex == 0;
      verify.value = false;
      buffer.value = false;
    } else {
      setOTP(otpIndex, "");
      currentotp[otpIndex - 1];
      otpIndex--;
      verify.value = false;
      buffer.value = false;
    }
  }
}
