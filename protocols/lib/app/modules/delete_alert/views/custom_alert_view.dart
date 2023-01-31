import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomLoadingAlert extends GetView {
  final String title;
  const CustomLoadingAlert({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.scale(
              scale: 0.8,
              child: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: const CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text('$title...')
          ],
        ),
      ),
    );
  }
}
