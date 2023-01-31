import 'package:get/get.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_controller.dart';

import 'package:protocols/app/modules/directors_add/controllers/directors_add_date_controller.dart';

class DirectorsAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectorsAddDateController>(
      () => DirectorsAddDateController(),
    );
    Get.lazyPut<DirectorsAddController>(
      () => DirectorsAddController(),
    );
  }
}
