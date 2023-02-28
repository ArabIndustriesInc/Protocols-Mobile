import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/voting_model.dart';
import 'package:protocols/app/data/providers/voting_provider.dart';
import 'package:protocols/app/routes/app_pages.dart';

class VotingController extends GetxController {
  List<Voting> votes = [];
  final BuildContext context;
  var loading = true.obs;
  var loadingDelete = false.obs;

  VotingController(this.context);
  getAllVotes() async {
    await VotingProvider().getAllVotes(context);
    update();
  }

  @override
  void onClose() {
    VotingProvider.isFinishedVoting = true;
    VotingProvider().onClose();
    super.onClose();
  }

  @override
  void onInit() async {
    getAllVotes();
    update();
    super.onInit();
  }
}

class VotingButtonView extends GetView {
  const VotingButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.VOTING_ADD);
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 35.w,
        ),
      ),
    );
  }
}
