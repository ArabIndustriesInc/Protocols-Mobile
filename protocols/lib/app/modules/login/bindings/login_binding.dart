import 'package:get/get.dart';
import 'package:protocols/app/modules/login/controllers/login_controller.dart';
import 'package:protocols/app/modules/login/controllers/login_field_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginFieldController>(
      () => LoginFieldController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
