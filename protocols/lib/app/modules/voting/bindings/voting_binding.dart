import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/voting/controllers/voting_controller.dart';

class VotingBinding extends Bindings {
  final BuildContext context;

  VotingBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<VotingController>(
      () => VotingController(context),
    );
  }
}
