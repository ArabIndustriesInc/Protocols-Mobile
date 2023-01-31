import 'package:get/get.dart';

import '../controllers/pricing_plan_controller.dart';

class PricingPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricingPlanController>(
      () => PricingPlanController(),
    );
  }
}
