import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';

class InvestorsBinding extends Bindings {
  final BuildContext context;

  InvestorsBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<InvestorsController>(
      () => InvestorsController(context),
    );
  }
}
