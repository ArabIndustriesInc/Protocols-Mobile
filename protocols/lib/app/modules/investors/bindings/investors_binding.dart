import 'package:get/get.dart';

import '../controllers/investors_controller.dart';

class InvestorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorsController>(
      () => InvestorsController(),
    );
  }
}
