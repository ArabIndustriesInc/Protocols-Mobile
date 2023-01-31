import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectorsController extends GetxController {
  List<DirectorsModel> directorsList = [];
  add(DirectorsModel directors) {
    directorsList.add(directors);
    update();
  }
}

class DirectorsModel {
  final String fName;
  final String dob;
  final String fatherName;
  final String address;
  final String emailID;
  final String mobNo;
  final String panNo;
  String? mName;
  String? lName;
  final String image;
  DirectorsModel(
    this.mName,
    this.lName, {
    required this.fName,
    required this.image,
    required this.fatherName,
    required this.address,
    required this.emailID,
    required this.dob,
    required this.mobNo,
    required this.panNo,
  });
}

class DirectorsButtonView extends GetView {
  const DirectorsButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.DIRECTORS_ADD);
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 35.w,
        ),
      ),
    );
  }
}
