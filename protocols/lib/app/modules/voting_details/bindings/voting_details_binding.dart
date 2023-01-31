import 'package:get/get.dart';

import '../controllers/voting_details_controller.dart';

class VotingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VotingDetailsController>(
      () => VotingDetailsController(),
    );
  }
}
