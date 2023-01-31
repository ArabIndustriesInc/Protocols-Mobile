import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/voting/controllers/voting_controller.dart';
import 'package:protocols/app/modules/voting/views/voting_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VotingView extends GetView<VotingController> {
  const VotingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20.0),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 23,
            ),
            Center(
              child: Text(
                'Voting',
                style: TextStyle(
                    fontSize: 25.sp,
                    letterSpacing: .9,
                    fontFamily: 'Montserrat Black'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Obx(
              () => (Get.find<VotingController>().loading.value)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(child: CircularProgressIndicator()))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: GetBuilder<VotingController>(
                          init: VotingController(),
                          builder: (_) {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return (Get.find<VotingController>()
                                        .votes
                                        .isEmpty)
                                    ? const EmptyDashMessage(title: 'No Votes!')
                                    : VotingCardView(
                                        index: index,
                                      );
                              },
                              separatorBuilder: (BuildContext context, index) {
                                return const SizedBox(
                                  height: 35,
                                );
                              },
                              itemCount: (Get.find<VotingController>()
                                      .votes
                                      .isEmpty)
                                  ? 1
                                  : Get.find<VotingController>().votes.length,
                            );
                          }),
                    ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          right: 10.w,
        ),
        child: const VotingButtonView(),
      ),
    );
  }
}
