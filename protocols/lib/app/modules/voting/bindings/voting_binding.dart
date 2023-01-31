import 'package:get/get.dart';

import '../controllers/voting_controller.dart';

class VotingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VotingController>(
      () => VotingController(),
    );
  }
}
