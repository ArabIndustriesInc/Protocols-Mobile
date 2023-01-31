import 'package:get/get.dart';
import 'package:protocols/app/modules/home/controllers/home_controller.dart';
import 'package:protocols/app/modules/links/controllers/links_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LinksController>(
      () => LinksController(),
    );
  }
}
