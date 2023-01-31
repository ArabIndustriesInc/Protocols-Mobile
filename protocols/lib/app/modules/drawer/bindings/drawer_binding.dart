import 'package:get/get.dart';
import 'package:protocols/app/modules/drawer/controllers/drawer_controller.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerNavController>(
      () => DrawerNavController(),
    );
  }
}
