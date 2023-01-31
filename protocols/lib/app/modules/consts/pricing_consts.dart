import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/pricing_plan/controllers/pricing_plan_controller.dart';

class PriceContents extends GetView {
  final String content;
  const PriceContents({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 15.w,
        ),
        Icon(
          FontAwesomeIcons.circleCheck,
          color: Colors.white,
          size: 22.w,
        ),
        SizedBox(
          width: 15.w,
        ),
        Flexible(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarPrice {
  final pricingAppBar = AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    // leading: Padding(
    //   padding: const EdgeInsets.only(left: 20.0),
    //   child: IconButton(
    //     onPressed: () {
    //       Get.back();
    //     },
    //     icon: Icon(
    //       Icons.west_rounded,
    //       size: 32.h,
    //       color: const Color(0xFF14AEF0),
    //     ),
    //   ),
    // ),
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

final divider = Divider(
  indent: 35,
  endIndent: 35,
  height: 25.h,
  thickness: 2.5,
  color: Colors.white,
);
final style = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)));

Text titleText(Data item) {
  return Text(
    item.title,
    style: TextStyle(
        color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
  );
}

final textTime = Text(
  'per month',
  style: TextStyle(
      color: Colors.white, fontSize: 14.sp, fontFamily: 'Montserrat Medium'),
);
Text buttonText(String text) {
  return Text(
    text,
    style: const TextStyle(
      letterSpacing: .9,
      color: Color(0xFF48BFF1),
      fontFamily: 'Montserrat Bold',
    ),
  );
}
