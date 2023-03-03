import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/delete_alert/controllers/delete_alert_controller.dart';

class DeleteAlertView extends GetView<DeleteAlertController> {
  final String title;
  final Widget action;
  final String subtitle;

  const DeleteAlertView({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.action,
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
          SizedBox(height: 30.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 22.h,
              fontFamily: 'Montserrat Bold',
              color: (title == 'Warning') ? Colors.red : Colors.black,
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          SizedBox(height: 35.h),
          const Divider(
            color: Colors.black45,
            thickness: .5,
            height: 1,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.w),
                  child: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.h,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 58.h,
                  child: const VerticalDivider(
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
