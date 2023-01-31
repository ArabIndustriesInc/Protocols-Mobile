import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors_details/controllers/directors_details_controller.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectorsDetailsView extends GetView<DirectorsDetailsController> {
  final DirectorsModel director;
  const DirectorsDetailsView({Key? key, required this.director})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom().appBar,
        drawer: DrawerView(),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "${director.fName} ${director.mName} ${director.lName}",
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(height: 25.h),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: MediaQuery.of(context).size.width / 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).size.width / 8.15,
                  backgroundImage: MemoryImage(
                    const Base64Decoder().convert(director.image),
                  ),
                ),
              ),
              EmpDrsInvDetailsCardView(
                title: 'Personal Details',
                contents: [
                  dobDate(),
                  EmpDrsInvTableContent(
                    content: '+91 ${director.mobNo}',
                    title: 'Mob No.',
                  ),
                  EmpDrsInvTableContent(
                    content: director.emailID,
                    title: 'Mail ID',
                  ),
                  EmpDrsInvTableContent(
                    content: director.fatherName,
                    title: 'Fathers name',
                  ),
                  EmpDrsInvTableContent(
                    content: director.panNo,
                    title: 'PAN No.',
                  ),
                  EmpDrsInvTableContent(
                    content: director.address,
                    title: 'Address',
                  ),
                ],
              ),
            ],
          ),
        )),
        bottomNavigationBar: DirectorDetailsButtonView(
          director: director,
        ));
  }

  EmpDrsInvTableContent dobDate() {
    final dateOg = DateTime.parse(director.dob);
    final year = dateOg.year;
    final monthOg = dateOg.month;
    final dayOg = dateOg.day;
    final month = (monthOg.toString().length == 1) ? '0$monthOg' : monthOg;
    final day = (dayOg.toString().length == 1) ? '0$dayOg' : dayOg;
    final date = '$day.$month.$year';
    return EmpDrsInvTableContent(
      content: date,
      title: 'D.O.B',
    );
  }
}



// Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: const [
                      //     DirectorsDetailsCardView(),
                      //   ],
                      // ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.S,
                      //   children: [
                      //     EmpDrsInvDetailsCardView(
                      //       title: 'Personal Details',
                      //       contents: Get.find<DirectorsDetailsController>()
                      //           .personalDetails,
                      //     ),
                      //   ],
                      // ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     EmpDrsInvDetailsCardView(
                      //       title: 'Share Details',
                      //       contents: Get.find<DirectorsDetailsController>()
                      //           .shareDetails,
                      //     ),
                      //   ],
                      // ),

                      // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     SingleChildScrollView(
              //       physics: const BouncingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: const [
              //               SizedBox(
              //                 height: 30,
              //               ),
              //               DirectorsDetailsCardView(),
              //             ],
              //           ),
              //           EmpDrsInvDetailsCardView(
              //             title: 'Personal Details',
              //             contents: Get.find<DirectorsDetailsController>()
              //                 .personalDetails,
              //           ),
              //           EmpDrsInvDetailsCardView(
              //             title: 'Share Details',
              //             contents: Get.find<DirectorsDetailsController>()
              //                 .shareDetails,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // )