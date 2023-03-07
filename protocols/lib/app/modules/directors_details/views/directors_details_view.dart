import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/empinvdir_consts.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors_details/controllers/directors_details_controller.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectorsDetailsView extends GetView<DirectorsController> {
  final int index;
  const DirectorsDetailsView({Key? key, required this.index}) : super(key: key);
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
                  height: 30.h,
                ),
                Center(
                  child: titleText(),
                ),
                SizedBox(height: 25.h),
                imageLoader(),
                EmpDrsInvDetailsCardView(
                  title: 'Personal Details',
                  contents: [
                    dobDate(),
                    EmpDrsInvTableContent(
                      content: Get.find<DirectorsController>()
                          .directors[index]
                          .mobile,
                      title: 'Mob No.',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<DirectorsController>()
                          .directors[index]
                          .email,
                      title: 'Mail ID',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<DirectorsController>()
                          .directors[index]
                          .fathersname,
                      title: 'Fathers name',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<DirectorsController>()
                          .directors[index]
                          .pannumber,
                      title: 'PAN No.',
                    ),
                    EmpDrsInvTableContent(
                      content: Get.find<DirectorsController>()
                          .directors[index]
                          .address,
                      title: 'Address',
                    ),
                  ],
                ),
              ],
            );
          }),
        )),
        bottomNavigationBar: DirectorDetailsButtonView(
          index: index,
        ));
  }

  Widget imageLoader() {
    try {
      return EmpInvDirImageShowCircle(
        img: Get.find<DirectorsController>().directors[index].image,
      );
    } catch (e) {
      log(e.toString());
      return Text(
        '${Get.find<DirectorsController>().directors[index].firstname}.png',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      );
    }
  }

  Text titleText() {
    final middlename = (Get.find<DirectorsController>()
                    .directors[index]
                    .middlename ==
                'Nil' ||
            Get.find<DirectorsController>().directors[index].middlename ==
                ' ' ||
            Get.find<DirectorsController>().directors[index].middlename ==
                'undefined' ||
            Get.find<DirectorsController>().directors[index].middlename == '' ||
            Get.find<DirectorsController>().directors[index].middlename == '.')
        ? ' '
        : ' ${Get.find<DirectorsController>().directors[index].middlename} ';
    final firstname =
        Get.find<DirectorsController>().directors[index].firstname;
    final lastname = Get.find<DirectorsController>().directors[index].lastname;
    return Text(
      '$firstname$middlename$lastname',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25.sp, letterSpacing: .9, fontFamily: 'Montserrat Black'),
    );
  }

  EmpDrsInvTableContent dobDate() {
    final dateOg =
        DateTime.parse(Get.find<DirectorsController>().directors[index].dob);
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
