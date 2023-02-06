import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/directors_edit/bindings/directors_edit_binding.dart';
import 'package:protocols/app/modules/directors_edit/views/directors_edit_view.dart';

class DirectorsDetailsController extends GetxController {}

class DirectorDetailsButtonView extends GetView {
  final int index;
  const DirectorDetailsButtonView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                Get.to(
                  () => DirectorsEditView(index: index),
                  binding: DirectorsEditBinding(),
                );
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(12.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                FontAwesomeIcons.userPen,
                color: Colors.white,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  // List<Widget> shareDetails = [
  //   Container(
  //     height: 10,
  //     color: Colors.transparent,
  //   ),
  //   const EmpDrsInvTableContent(
  //     content: '100\$',
  //     title: 'Avg Price Per share',
  //   ),
  //   const EmpDrsInvTableContent(
  //     content: '100\$',
  //     title: 'Current Price per Share',
  //   ),
  //   const EmpDrsInvTableContent(
  //     content: '100\$',
  //     title: 'Total no.of shares',
  //   ),
  //   Center(
  //     child: ElevatedButton(
  //       onPressed: () {},
  //       style: ElevatedButton.styleFrom(
  //           backgroundColor: const Color(0xff036BBF),
  //           shadowColor: Colors.transparent,
  //           elevation: 0,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10))),
  //       child: const Text('View Share History'),
  //     ),
  //   )
  // ];