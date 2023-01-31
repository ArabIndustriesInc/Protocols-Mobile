import 'package:get/get.dart';

import 'package:protocols/app/modules/transactions_add/controllers/transactions_add_date_controller.dart';

import '../controllers/transactions_add_controller.dart';

class TransactionsAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionsAddDateController>(
      () => TransactionsAddDateController(),
    );
    Get.lazyPut<TransactionsAddController>(
      () => TransactionsAddController(),
    );
  }
}
