import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_details/controllers/employees_details_controller.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EmployeesDetailsView extends GetView<EmployeesDetailsController> {
  final int index;
  const EmployeesDetailsView({Key? key, required this.index}) : super(key: key);
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
                SizedBox(height: 15.h),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width / 7,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.width / 7.15,
                    backgroundImage: NetworkImage(
                      Get.find<EmployeesController>().employees[index].image,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      controller:
                          Get.find<EmployeesDetailsController>().pageController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EmpDrsInvDetailsCardView(
                            title: 'Work Details',
                            contents: [
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .position,
                                title: 'Designation',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .employeeid,
                                title: 'Employee ID',
                              ),
                              // joinDate(),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .worklocation,
                                title: 'Work Location',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .pfaccountnumber,
                                title: 'PF Account No',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .uannumber,
                                title: 'UAN No.',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .esinumber,
                                title: 'ESI No.',
                              ),
                            ],
                          ),
                          EmpDrsInvDetailsCardView(
                            title: 'Personal Details',
                            contents: [
                              // dobDate(),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .mobile,
                                title: 'Mob No.',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .email,
                                title: 'Mail ID',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .fathersname,
                                title: 'Fathers name',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .pannumber,
                                title: 'PAN No.',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .address,
                                title: 'Address',
                              ),
                            ],
                          ),
                          EmpDrsInvDetailsCardView(
                            title: 'Payment Details',
                            contents: [
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .paymentMode,
                                title: 'Payment Mode',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .accName,
                                title: 'Account Holder',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .bank,
                                title: 'Bank Name',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .accNo,
                                title: 'Account No.',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .type,
                                title: 'Type',
                              ),
                              EmpDrsInvTableContent(
                                content: Get.find<EmployeesController>()
                                    .employees[index]
                                    .ifsc,
                                title: 'IFSC',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller:
                        Get.find<EmployeesDetailsController>().pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: JumpingDotEffect(
                      spacing: 10.w,
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      radius: 20.w,
                      dotColor: Colors.grey[300]!,
                      // dotColor: const Color(0xFFD3EBFF),
                      activeDotColor: const Color(0xFF469AFA),
                    ),
                  ),
                )
              ],
            );
          }),
        )),
        bottomNavigationBar: EmployeesDetailsButtonView(
          index: index,
        ));
  }

  Text titleText() {
    final middlename = (Get.find<EmployeesController>()
                    .employees[index]
                    .middlename ==
                'Nil' ||
            Get.find<EmployeesController>().employees[index].middlename ==
                ' ' ||
            Get.find<EmployeesController>().employees[index].middlename ==
                'undefined' ||
            Get.find<EmployeesController>().employees[index].middlename == '' ||
            Get.find<EmployeesController>().employees[index].middlename == '.')
        ? ' '
        : ' ${Get.find<EmployeesController>().employees[index].middlename} ';
    final firstname =
        Get.find<EmployeesController>().employees[index].firstname;
    final lastname = Get.find<EmployeesController>().employees[index].lastname;
    return Text(
      '$firstname$middlename$lastname',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25.sp, letterSpacing: .9, fontFamily: 'Montserrat Black'),
    );
  }

  EmpDrsInvTableContent dobDate() {
    final dateOg =
        DateTime.parse(Get.find<EmployeesController>().employees[index].dob);
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

  EmpDrsInvTableContent joinDate() {
    final dateOg = DateTime.parse(
        Get.find<EmployeesController>().employees[index].joiningdate);
    final year = dateOg.year;
    final monthOg = dateOg.month;
    final dayOg = dateOg.day;
    final month = (monthOg.toString().length == 1) ? '0$monthOg' : monthOg;
    final day = (dayOg.toString().length == 1) ? '0$dayOg' : dayOg;
    final date = '$day.$month.$year';
    return EmpDrsInvTableContent(
      content: date,
      title: 'Date of Joining',
    );
  }
}
//SizedBox(
//   width: MediaQuery.of(context).size.width,
//   height: MediaQuery.of(context).size.height -
//       MediaQuery.of(context).size.height / 3.5,
//   child: ListView(
//     shrinkWrap: true,
//     scrollDirection: Axis.horizontal,
//     physics: const BouncingScrollPhysics(),
//     children: [
//       EmpDrsInvDetailsCardView(
//         title: 'Work Details',
//         contents:
//             Get.find<EmployeesDetailsController>().workDetails,
//       ),
//       EmpDrsInvDetailsCardView(
//         title: 'Personal Details',
//         contents: Get.find<EmployeesDetailsController>()
//             .personalDetails,
//       ),
//       EmpDrsInvDetailsCardView(
//         title: 'Payment Details',
//         contents:
//             Get.find<EmployeesDetailsController>().paymentDetails,
//       ),
//     ],
//   ),
// )
