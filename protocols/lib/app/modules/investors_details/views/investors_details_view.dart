import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/empinvdir_consts.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:protocols/app/modules/investors_details/controllers/investors_details_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestorsDetailsView extends GetView<InvestorsDetailsController> {
  final int index;
  const InvestorsDetailsView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom().appBar(context),
        drawer: DrawerView(),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Obx(() {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: titleText(),
                ),
                SizedBox(height: 25.h),
                imageLoader(),
                // CircleAvatar(
                //   backgroundColor: Colors.grey,
                //   radius: MediaQuery.of(context).size.width / 8,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.white,
                //     radius: MediaQuery.of(context).size.width / 8.15,
                //     backgroundImage: MemoryImage(
                //       const Base64Decoder().convert(Get.find<InvestorsController>().investors[index].image),
                //     ),
                //   ),
                // ),
                EmpDrsInvDetailsCardView(
                  title: 'Personal Details',
                  contents: [
                    dobDate(),
                    EmpDrsInvTableContent(
                      content:
                          '+91 ${Get.find<InvestorsController>().investors[index].mobile}',
                      title: 'Mob No.',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<InvestorsController>()
                          .investors[index]
                          .email,
                      title: 'Mail ID',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<InvestorsController>()
                          .investors[index]
                          .fathersname,
                      title: 'Fathers name',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<InvestorsController>()
                          .investors[index]
                          .pannumber,
                      title: 'PAN No.',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<InvestorsController>()
                          .investors[index]
                          .address,
                      title: 'Address',
                    ),
                  ],
                ),
              ],
            );
          }),
        )),
        bottomNavigationBar: InvestorsDetailsButtonView(
          index: index,
        ));
  }

  Text titleText() {
    final middlename = (Get.find<InvestorsController>()
                    .investors[index]
                    .middlename ==
                'Nil' ||
            Get.find<InvestorsController>().investors[index].middlename ==
                ' ' ||
            Get.find<InvestorsController>().investors[index].middlename ==
                'undefined' ||
            Get.find<InvestorsController>().investors[index].middlename == '' ||
            Get.find<InvestorsController>().investors[index].middlename == '.')
        ? ' '
        : ' ${Get.find<InvestorsController>().investors[index].middlename} ';
    final firstname =
        Get.find<InvestorsController>().investors[index].firstname;
    final lastname = Get.find<InvestorsController>().investors[index].lastname;
    return Text(
      '$firstname$middlename$lastname',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25.sp, letterSpacing: .9, fontFamily: 'Montserrat Black'),
    );
  }

  Widget imageLoader() {
    try {
      return EmpInvDirImageShowCircle(
        img: Get.find<InvestorsController>().investors[index].image,
      );
    } catch (e) {
      log(e.toString());
      return Text(
        '${Get.find<InvestorsController>().investors[index].firstname}.png',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      );
    }
  }

  EmpDrsInvTableContent dobDate() {
    final dateOg =
        DateTime.parse(Get.find<InvestorsController>().investors[index].dob);
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