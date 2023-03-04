import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/settings_appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSetting().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Obx(() {
          return (Get.find<SettingsController>().loading.value)
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: const Center(child: CircularProgressIndicator()))
              : (Get.find<SettingsController>().profile != null)
                  ? ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: titleText(),
                        ),
                        SizedBox(height: 25.h),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: MediaQuery.of(context).size.width / 7,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: MediaQuery.of(context).size.width / 7.15,
                            backgroundImage: NetworkImage(
                              Get.find<SettingsController>().profile!.image,
                            ),
                          ),
                        ),
                        EmpDrsInvDetailsCardView(
                          title: 'Personal Details',
                          contents: [
                            dobDate(),
                            EmpDrsInvTableContent(
                              content: Get.find<SettingsController>()
                                  .profile!
                                  .mobile,
                              title: 'Mob No.',
                            ),
                            EmpDrsInvTableContent(
                              content:
                                  Get.find<SettingsController>().profile!.email,
                              title: 'Mail ID',
                            ),
                            EmpDrsInvTableContent(
                              content: Get.find<SettingsController>()
                                  .profile!
                                  .fathersname,
                              title: 'Fathers name',
                            ),
                            EmpDrsInvTableContent(
                              content: Get.find<SettingsController>()
                                  .profile!
                                  .pannumber,
                              title: 'PAN No.',
                            ),
                            EmpDrsInvTableContent(
                              content: Get.find<SettingsController>()
                                  .profile!
                                  .address,
                              title: 'Address',
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center(
                      child: Text('Oops! Error occured!'),
                    );
        }),
      )),
      // bottomNavigationBar: DirectorDetailsButtonView(
      //   index: index,
      // ),
    );
  }

  Text titleText() {
    final middlename = (Get.find<SettingsController>().profile!.middlename ==
                'Nil' ||
            Get.find<SettingsController>().profile!.middlename == ' ' ||
            Get.find<SettingsController>().profile!.middlename == 'undefined' ||
            Get.find<SettingsController>().profile!.middlename == '' ||
            Get.find<SettingsController>().profile!.middlename == '.')
        ? ' '
        : ' ${Get.find<SettingsController>().profile!.middlename} ';
    final firstname = Get.find<SettingsController>().profile!.firstname;
    final lastname = Get.find<SettingsController>().profile!.lastname;
    return Text(
      '$firstname$middlename$lastname',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25.sp, letterSpacing: .9, fontFamily: 'Montserrat Black'),
    );
  }

  EmpDrsInvTableContent dobDate() {
    final dateOg = DateTime.parse(Get.find<SettingsController>().profile!.dob);
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
