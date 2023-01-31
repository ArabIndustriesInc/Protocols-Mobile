import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulletListCardView extends GetView {
  final String section;
  const BulletListCardView({Key? key, required this.section}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 45, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: const [
              SizedBox(
                height: 2,
              ),
              Icon(
                Icons.fiber_manual_record_rounded,
                size: 16,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              section,
              textAlign: TextAlign.justify,
              style:
                  TextStyle(fontFamily: 'Montserrat Medium', fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
