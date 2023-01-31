import 'package:get/get.dart';
import 'package:protocols/app/modules/directors_details/controllers/directors_details_controller.dart';

class DirectorsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectorsDetailsController>(
      () => DirectorsDetailsController(),
    );
  }
}
