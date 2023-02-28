import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';

class DirectorsBinding extends Bindings {
  final BuildContext context;

  DirectorsBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<DirectorsController>(
      () => DirectorsController(context),
    );
  }
}
