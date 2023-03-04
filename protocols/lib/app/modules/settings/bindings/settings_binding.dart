import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  final BuildContext context;
  SettingsBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(context),
    );
  }
}
