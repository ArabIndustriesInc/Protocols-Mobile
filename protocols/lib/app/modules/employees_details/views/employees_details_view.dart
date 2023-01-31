import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_details/controllers/employees_details_controller.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesDetailsView extends GetView<EmployeesDetailsController> {
  final EmployeeModel employee;
  const EmployeesDetailsView({Key? key, required this.employee})
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
                  "${employee.fName} ${employee.mName} ${employee.lName}",
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(height: 15.h),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: MediaQuery.of(context).size.width / 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).size.width / 8.15,
                  backgroundImage: MemoryImage(
                    const Base64Decoder().convert(employee.image!),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EmpDrsInvDetailsCardView(
                          title: 'Work Details',
                          contents: [
                            EmpDrsInvTableContent(
                              content: employee.designation,
                              title: 'Designation',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.empID,
                              title: 'Employee ID',
                            ),
                            joinDate(),
                            EmpDrsInvTableContent(
                              content: employee.location,
                              title: 'Work Location',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.pfAcNo!,
                              title: 'PF Account No',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.uanNo!,
                              title: 'UAN No.',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.esiNo!,
                              title: 'ESI No.',
                            ),
                          ],
                        ),
                        EmpDrsInvDetailsCardView(
                          title: 'Personal Details',
                          contents: [
                            dobDate(),
                            EmpDrsInvTableContent(
                              content: '+91${employee.mobNo}',
                              title: 'Mob No.',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.emailID,
                              title: 'Mail ID',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.fatherName,
                              title: 'Fathers name',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.panNo,
                              title: 'PAN No.',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.address,
                              title: 'Address',
                            ),
                          ],
                        ),
                        EmpDrsInvDetailsCardView(
                          title: 'Payment Details',
                          contents: [
                            EmpDrsInvTableContent(
                              content: employee.payment,
                              title: 'Payment Mode',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.accHolder,
                              title: 'Account Holder',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.bankName,
                              title: 'Bank Name',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.accNo,
                              title: 'Account No.',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.accType,
                              title: 'Type',
                            ),
                            EmpDrsInvTableContent(
                              content: employee.ifsc,
                              title: 'IFSC',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //
            ],
          ),
        )),
        bottomNavigationBar: EmployeesDetailsButtonView(
          employee: employee,
        ));
  }

  EmpDrsInvTableContent dobDate() {
    final dateOg = DateTime.parse(employee.dob);
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
    final dateOg = DateTime.parse(employee.joiningDate);
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
