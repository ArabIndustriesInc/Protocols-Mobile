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
            Obx(
              () => (Get.find<InvestorsController>().loading.value)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(child: CircularProgressIndicator()))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return (Get.find<InvestorsController>()
                                  .investors
                                  .isEmpty)
                              ? const EmptyDashMessage(title: 'No Investors!')
                              : InvestorsCardView(index: index);
                        },
                        itemCount: (Get.find<InvestorsController>()
                                .investors
                                .isEmpty)
                            ? 1
                            : Get.find<InvestorsController>().investors.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 30.h,
                          );
                        },
                      ),
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
        child: const InvesetorsButtonView(),
      ),
    );
  }
}
