import 'package:get/get.dart';

import 'package:protocols/app/modules/account_details/controllers/account_details_controller.dart';
import 'package:protocols/app/modules/account_details/controllers/account_logo_controller.dart';

class AccountDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountLogoController>(
      () => AccountLogoController(),
    );
    Get.lazyPut<AccountDetailsController>(
      () => AccountDetailsController(),
    );
  }
}
