import 'package:get/get.dart';
import 'package:protocols/app/modules/links/controllers/links_controller.dart';

class LinksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LinksController>(
      () => LinksController(),
    );
  }
}
