import 'package:get/get.dart';
import 'package:protocols/app/modules/custom_alert/controllers/custom_alert_controller.dart';

class CustomAlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomAlertController>(
      () => CustomAlertController(),
    );
  }
}
