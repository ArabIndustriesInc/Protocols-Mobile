import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/routes/app_pages.dart';

class InvestorsController extends GetxController {
  List<InvestorsModel> investorsList = [];
  add(InvestorsModel investor) {
    investorsList.add(investor);
    update();
  }
}

class InvestorsModel {
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
  InvestorsModel(
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

class InvesetorsButtonView extends GetView {
  const InvesetorsButtonView({Key? key}) : super(key: key);

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
          Get.toNamed(Routes.INVESTORS_ADD);
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
