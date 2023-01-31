import 'package:get/get.dart';
import 'package:protocols/app/modules/signup/controllers/signup_controller.dart';
import 'package:protocols/app/modules/signup/controllers/text_field_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextFieldController>(
      () => TextFieldController(),
    );
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
