// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardCardView extends GetView<DashboardController> {
  final String icon;
  final String title;

  const DashboardCardView({required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffF9FCFF),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 4,
              color: const Color(0xffABC2D4).withOpacity(.8),
            ),
          ],
        ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: const Color(0xffF6FBFF),
        //   boxShadow: const [
        //     BoxShadow(
        //       spreadRadius: .5,
        //       offset: Offset(2, 2),
        //       blurRadius: 10,
        //       color: Color.fromARGB(40, 15, 15, 15),
        //     ),
        //   ],
        // ),
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            Get.find<DashboardController>().onClicked(title);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 23.w,
              vertical: 23.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (icon == 'assets/icons/notes.svg')
                    ? SvgPicture.asset(
                        'assets/icons/notes.svg',
                        width: 40.w,
                      )
                    : Image.asset(
                        icon,
                        width: 40.w,
                      ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.sp,
                      letterSpacing: .5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    size: 20.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
