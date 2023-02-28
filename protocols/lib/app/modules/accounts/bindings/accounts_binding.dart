import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:protocols/app/modules/add_account/controllers/add_acc_model_controller.dart';

class AccountsBinding extends Bindings {
  final BuildContext context;

  AccountsBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<AccountsController>(
      () => AccountsController(context),
    );
    Get.lazyPut<AddAccModelController>(
      () => AddAccModelController(),
    );
  }
}
