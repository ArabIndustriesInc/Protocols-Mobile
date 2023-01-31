import 'package:get/get.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:protocols/app/modules/add_account/controllers/add_acc_model_controller.dart';

class AccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountsController>(
      () => AccountsController(),
    );
    Get.lazyPut<AddAccModelController>(
      () => AddAccModelController(),
    );
  }
}
