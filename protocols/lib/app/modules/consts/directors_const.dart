import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_date_controller.dart';

class DatePickDirectorsPeronalCardAdd extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const DatePickDirectorsPeronalCardAdd(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: const Color(0xffABC2D4).withOpacity(.8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Get.find<DirectorsAddDateController>().datePickerPersonal(context);
        },
        style: TextButton.styleFrom(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: Colors.black,
                size: iconSize,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subTitle,
                    style:
                        const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  ),
                  title,
                ],
              ),
            ),
            const Icon(
              Icons.expand_more_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class ImageDisplayDirectorsAdd extends GetView {
  final ImageProvider<Object> image;
  final InkWell pickMedia;
  const ImageDisplayDirectorsAdd(
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
