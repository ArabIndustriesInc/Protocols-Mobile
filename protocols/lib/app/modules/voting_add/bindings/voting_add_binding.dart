import 'package:get/get.dart';
import 'package:protocols/app/modules/voting_add/controllers/voting_add_controller.dart';

class VotingAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VotingAddController>(
      () => VotingAddController(),
    );
  }
}
