import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:protocols/app/modules/investors_details/controllers/investors_details_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestorsDetailsView extends GetView<InvestorsDetailsController> {
  final InvestorsModel investor;
  const InvestorsDetailsView({Key? key, required this.investor})
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
                  "${investor.fName} ${investor.mName} ${investor.lName}",
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
                    const Base64Decoder().convert(investor.image),
                  ),
                ),
              ),
              EmpDrsInvDetailsCardView(
                title: 'Personal Details',
                contents: [
                  dobDate(),
                  EmpDrsInvTableContent(
                    content: '+91 ${investor.mobNo}',
                    title: 'Mob No.',
                  ),
                  EmpDrsInvTableContent(
                    content: investor.emailID,
                    title: 'Mail ID',
                  ),
                  EmpDrsInvTableContent(
                    content: investor.fatherName,
                    title: 'Fathers name',
                  ),
                  EmpDrsInvTableContent(
                    content: investor.panNo,
                    title: 'PAN No.',
                  ),
                  EmpDrsInvTableContent(
                    content: investor.address,
                    title: 'Address',
                  ),
                ],
              ),
            ],
          ),
        )),
        bottomNavigationBar: InvestorsDetailsButtonView(
          investor: investor,
        ));
  }

  EmpDrsInvTableContent dobDate() {
    final dateOg = DateTime.parse(investor.dob);
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


//  SizedBox(
//                 height: MediaQuery.of(context).size.height / 1.65,
//                 child: ListView(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         InvestorsDetailsCardView(),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         EmpDrsInvDetailsCardView(
//                           title: 'Personal Details',
//                           contents: Get.find<InvestorsDetailsController>()
//                               .personalDetails,
//                         ),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         EmpDrsInvDetailsCardView(
//                           title: 'Share Details',
//                           contents: Get.find<InvestorsDetailsController>()
//                               .shareDetails,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )