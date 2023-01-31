import 'package:get/get.dart';

import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_date_controller.dart';

import '../controllers/directors_edit_controller.dart';

class DirectorsEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectorsEditDateController>(
      () => DirectorsEditDateController(),
    );
    Get.lazyPut<DirectorsEditController>(
      () => DirectorsEditController(),
    );
  }
}
