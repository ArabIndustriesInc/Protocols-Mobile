// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/custom_alert/controllers/custom_alert_controller.dart';
import 'package:protocols/app/modules/documents/controllers/documents_controller.dart';

class CustomAlert extends GetView<CustomAlertController> {
  final String title;
  final Widget action;
  final Widget content;
  final Widget? warning;
  final Color color;
  bool? isWarning = false;

  CustomAlert({
    Key? key,
    this.warning,
    this.isWarning,
    required this.title,
    required this.action,
    required this.content,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25),
          Text(
            title,
            style: TextStyle(
                fontSize: 23.sp, fontFamily: 'Montserrat Bold', color: color),
          ),
          const SizedBox(height: 20),
          content,
          const SizedBox(height: 10),
          warning!,
          const SizedBox(height: 30),
          const Divider(
            color: Colors.black45,
            thickness: .5,
            height: .2,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      Get.back();
                      if (isWarning!) {
                        Get.find<DocumentsController>().errorIsVisible.value =
                            false;
                        Get.find<DocumentsController>().controller.clear();
                      }
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: const Color(0xffFE0000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 58,
                  child: VerticalDivider(
                    color: Colors.black45,
                    thickness: .5,
                  ),
                ),
                action,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
