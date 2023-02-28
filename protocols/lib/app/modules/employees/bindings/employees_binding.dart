import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';

class EmployeesBinding extends Bindings {
  final BuildContext context;

  EmployeesBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<EmployeesController>(
      () => EmployeesController(context),
    );
  }
}
