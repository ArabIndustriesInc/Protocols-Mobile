import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/voting_model.dart';
import 'package:protocols/app/data/providers/voting_provider.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/voting/controllers/voting_controller.dart';
import 'package:protocols/app/modules/voting_details/controllers/voting_details_controller.dart';
import 'package:protocols/app/modules/voting_details/views/voting_details_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VotingDetailsView extends GetView<VotingDetailsController> {
  final int index;
  const VotingDetailsView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                Get.find<VotingController>().votes[index].title,
                style: TextStyle(
                  fontSize: 22.sp,
                  letterSpacing: .3,
                  fontFamily: 'Montserrat Bold',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.w),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromARGB(255, 209, 209, 209),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Get.find<VotingController>().votes[index].description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14.sp, fontFamily: 'Montserrat Medium'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Options',
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                  voteDate(),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            VotingDetailsCardView(
              bullet: 'A',
              onPressed: () {
                if (!Get.find<VotingDetailsController>()
                    .loadingVoteStatus
                    .value) {
                  Get.find<VotingDetailsController>().loadingVoteStatus.value =
                      true;
                  final id = Get.find<VotingController>().votes[index].id;
                  final voteStatus = VotingStatus(status: 'yes', voteId: id);
                  VotingProvider().addVoteStatus(voteStatus, context);
                  Get.back();
                }
              },
              option: 'Yes',
            ),
            SizedBox(
              height: 20.h,
            ),
            VotingDetailsCardView(
              bullet: 'B',
              onPressed: () {
                if (!Get.find<VotingDetailsController>()
                    .loadingVoteStatus
                    .value) {
                  Get.find<VotingDetailsController>().loadingVoteStatus.value =
                      true;
                  final id = Get.find<VotingController>().votes[index].id;
                  final voteStatus = VotingStatus(status: 'no', voteId: id);
                  VotingProvider().addVoteStatus(voteStatus, context);
                  Get.back();
                }
              },
              option: 'No',
            ),
          ],
        ),
      ),
      floatingActionButton: const VotingDetailsButton(),
    );
  }

  Text voteDate() {
    final voteDate =
        Get.find<VotingController>().votes[index].selectdate.toString();
    return Text(
      '${DateTime.parse(voteDate).day}-${DateTime.parse(voteDate).month}-${DateTime.parse(voteDate).year}',
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.grey,
      ),
    );
  }
}
