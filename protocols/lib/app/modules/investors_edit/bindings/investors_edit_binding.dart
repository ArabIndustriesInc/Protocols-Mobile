import 'package:get/get.dart';

import 'package:protocols/app/modules/investors_edit/controllers/investors_edit_date_controller.dart';

import '../controllers/investors_edit_controller.dart';

class InvestorsEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestorsEditDateController>(
      () => InvestorsEditDateController(),
    );
    Get.lazyPut<InvestorsEditController>(
      () => InvestorsEditController(),
    );
  }
}
