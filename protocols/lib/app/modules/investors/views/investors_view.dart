import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:protocols/app/modules/investors/views/investors_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestorsView extends GetView<InvestorsController> {
  const InvestorsView({Key? key}) : super(key: key);
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
                'Investors',
                style: TextStyle(
                  fontSize: 25.sp,
                  letterSpacing: .9,
                  fontFamily: 'Montserrat Black',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            (Get.find<InvestorsController>().investorsList.isEmpty)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(
                      child: Text(
                        'No Investors!',
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: GetBuilder<InvestorsController>(
                        init: InvestorsController(),
                        builder: (_) {
                          return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                final investor = Get.find<InvestorsController>()
                                    .investorsList[index];
                                return InvestorsCardView(
                                  investor: investor,
                                );
                              },
                              separatorBuilder: (BuildContext context, index) {
                                return const SizedBox(
                                  height: 30,
                                );
                              },
                              itemCount: Get.find<InvestorsController>()
                                  .investorsList
                                  .length);
                        }),
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
        child: const InvesetorsButtonView(),
      ),
    );
  }
}
