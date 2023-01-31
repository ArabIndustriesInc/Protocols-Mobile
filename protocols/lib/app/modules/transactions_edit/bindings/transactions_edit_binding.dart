import 'package:get/get.dart';

import 'package:protocols/app/modules/transactions_edit/controllers/transactions_edit_date_controller.dart';

import '../controllers/transactions_edit_controller.dart';

class TransactionsEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionsEditDateController>(
      () => TransactionsEditDateController(),
    );
    Get.lazyPut<TransactionsEditController>(
      () => TransactionsEditController(),
    );
  }
}
