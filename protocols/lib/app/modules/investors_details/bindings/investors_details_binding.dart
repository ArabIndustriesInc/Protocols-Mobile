import 'package:get/get.dart';

import '../controllers/investors_details_controller.dart';

class InvestorsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorsDetailsController>(
      () => InvestorsDetailsController(),
    );
  }
}
