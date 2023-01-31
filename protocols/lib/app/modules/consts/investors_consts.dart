import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageDisplayInvestorsAdd extends GetView {
  final ImageProvider<Object> image;
  final InkWell pickMedia;
  const ImageDisplayInvestorsAdd(
      {Key? key, required this.image, required this.pickMedia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 61.h,
            backgroundColor: const Color(0xff2683D5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: image,
              radius: 60.h,
            ),
          ),
          Positioned(
            bottom: 2,
            right: -1,
            child: CircleAvatar(
              radius: 18.h,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Container(
                    height: 30.h,
                    width: 30.h,
                    color: const Color(0xff2683D5),
                    child: pickMedia),
              ),
            ),
          )
        ],
      ),
    );
  }
}
