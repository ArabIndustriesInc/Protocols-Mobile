import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileHeaderView extends GetView {
  final String image;
  final String name;
  final String email;
  final String phNo;
  const ProfileHeaderView({
    Key? key,
    required this.email,
    required this.image,
    required this.name,
    required this.phNo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffF3F8FF),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.width / 9.5,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(
                width: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat Bold',
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    '+91 $phNo',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}

class ProfileContents extends GetView {
  final String title;
  final String content;
  const ProfileContents({Key? key, required this.content, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat SemiBold',
                        color: const Color(0xff464646),
                      ),
                    ),
                  ),
                  Text(':',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ))
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat Medium',
                    color: const Color(0xff5E5E5E),
                  ),
                ),
              ),
            ],
          ),
          (title == 'Address')
              ? const SizedBox()
              : const Divider(
                  height: 12,
                  thickness: 1.2,
                ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
