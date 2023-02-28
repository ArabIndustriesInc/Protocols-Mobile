import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/data/providers/files_provider.dart';

class AppBarCustom {
  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: const CircleBorder(),
              ),
              child: SvgPicture.asset(
                'assets/icons/drawer.svg',
                height: 40.w,
              )),
        );
      }),
      elevation: 0.2,
      //backgroundColor: Color(0xffEAF5FA),
      backgroundColor: const Color(0xffF3F8FF),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TextButton(
            onPressed: () {
              {
                for (var i = 0; i < 3; i++) {
                  if (homeContext == context) {
                    break;
                  }
                  if (FilesProvider.isFinishedFolderDownloading == false) {
                    Get.back();
                  }
                }
              }
              // Get.offNamed(Routes.HOME);
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

  final appBarPricing = AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    leading: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const CircleBorder(),
            ),
            child: SvgPicture.asset(
              'assets/icons/drawer.svg',
              height: 40.w,
            )),
      );
    }),
    actions: [
      Center(
        child: Text(
          'Our Plans',
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
        ),
      ),
      SizedBox(
        width: 35.h,
      )
    ],
  );
}

class SnackbarMessage {
  snackBarMessage(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      backgroundColor: const Color(0xff1E1E1E),
      duration: Duration(
          seconds: (message == 'Registered successfully. Login to get started')
              ? 3
              : 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class EmptyDashMessage extends GetView {
  final String title;
  const EmptyDashMessage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
      ),
    );
  }
}

BuildContext? homeContext;
