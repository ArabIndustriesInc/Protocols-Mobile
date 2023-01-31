import 'package:get/get.dart';
import 'package:protocols/app/modules/delete_alert/controllers/delete_alert_controller.dart';

class DeleteAlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAlertController>(
      () => DeleteAlertController(),
    );
  }
}
