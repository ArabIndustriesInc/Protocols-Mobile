import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class SettingsCardView extends GetView {
  final GestureTapCallback onTap;
  final String image;
  final String title;
  final Color color;
  const SettingsCardView({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: (color == Colors.white)
                  ? const Color.fromARGB(255, 193, 193, 193).withOpacity(0.4)
                  : Colors.transparent,
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: (color == Colors.white)
            ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.transparent,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onTap: onTap,
                  leading: SvgPicture.asset(
                    image,
                    height: 30.h,
                  ),
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.black,
                  ),
                ))
            : ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                leading: SvgPicture.asset(
                  image,
                  height: 30.h,
                ),
                title: Text(
                  title,
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
