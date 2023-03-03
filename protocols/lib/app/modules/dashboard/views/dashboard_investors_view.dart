import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:protocols/app/modules/dashboard/views/dashboard_card_view.dart';

class DashboardInvestorsView extends GetView {
  DashboardInvestorsView({Key? key}) : super(key: key);
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 45.w, bottom: 14.h),
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 24.sp,
              fontFamily: 'Montserrat Bold',
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            return DashboardCardView(
              icon: _dashboardController.dashboardIconInvestors[index],
              title: _dashboardController.dashboardTitleInvestors[index],
            );
          },
          itemCount: _dashboardController.dashboardTitleInvestors.length,
        ),
      ],
    );
  }
}
