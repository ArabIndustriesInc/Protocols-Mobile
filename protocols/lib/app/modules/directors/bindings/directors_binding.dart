import 'package:get/get.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';

class DirectorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectorsController>(
      () => DirectorsController(),
    );
  }
}
