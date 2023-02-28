import 'package:get/get.dart';

import '../controllers/upgrade_plan_controller.dart';

class UpgradePlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradePlanController>(
      () => UpgradePlanController(),
    );
  }
}
