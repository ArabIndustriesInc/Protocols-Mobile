import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/voting_provider.dart';

class VotingDetailsController extends GetxController {
  var loadingVoteStatus = false.obs;
  var countYes = 100.obs;
  var countNo = 100.obs;
  void percent(int countYes, int countNo) {
    this.countNo.value = countNo;
    this.countYes.value = countYes;
    update();
  }

  showStatus(String voteId, BuildContext context) {
    VotingProvider().showVoteStatus(voteId, context);
  }
}

class VotingDetailsButton extends GetView {
  const VotingDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
                colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: TextButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              padding: EdgeInsets.all(10.w),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 30.h,
          ),
        ),
      ),
    );
  }
}
