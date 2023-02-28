import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/transactions_controller.dart';

class TransactionsBinding extends Bindings {
  final BuildContext context;

  TransactionsBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<TransactionsController>(
      () => TransactionsController(context),
    );
  }
}
