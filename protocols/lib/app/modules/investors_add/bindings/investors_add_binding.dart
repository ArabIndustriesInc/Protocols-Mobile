import 'package:get/get.dart';

import 'package:protocols/app/modules/investors_add/controllers/investors_add_date_controller.dart';

import '../controllers/investors_add_controller.dart';

class InvestorsAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorsAddDateController>(
      () => InvestorsAddDateController(),
    );
    Get.lazyPut<InvestorsAddController>(
      () => InvestorsAddController(),
    );
  }
}
