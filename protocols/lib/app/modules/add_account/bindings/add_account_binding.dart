import 'package:get/get.dart';

import 'package:protocols/app/modules/add_account/controllers/add_acc_model_controller.dart';
import 'package:protocols/app/modules/add_account/controllers/add_account_controller.dart';

class AddAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAccModelController>(
      () => AddAccModelController(),
    );
    Get.lazyPut<AddAccountController>(
      () => AddAccountController(),
    );
  }
}
