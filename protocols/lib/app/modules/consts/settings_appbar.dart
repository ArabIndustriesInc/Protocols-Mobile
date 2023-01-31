import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSetting {
  final appBar = AppBar(
    leading: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: SvgPicture.asset(
              'assets/icons/drawer.svg',
              height: 40.w,
            )),
      );
    }),
    elevation: 0,
    //backgroundColor: Color(0xffEAF5FA),
    backgroundColor: const Color(0xffF3F8FF),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: TextButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
          child: Image.asset(
            'assets/images/logo.png',
            width: 160.w,
          ),
        ),
      )
    ],
  );
}
