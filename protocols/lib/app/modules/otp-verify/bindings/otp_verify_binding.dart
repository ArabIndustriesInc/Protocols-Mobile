import 'package:get/get.dart';

import 'package:protocols/app/modules/otp-verify/controllers/otp_controller.dart';

import '../controllers/otp_verify_controller.dart';

class OtpVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
    Get.lazyPut<OtpVerifyController>(
      () => OtpVerifyController(),
    );
  }
}
