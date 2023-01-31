import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_details/bindings/employees_details_binding.dart';
import 'package:protocols/app/modules/employees_details/views/employees_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeCardView extends GetView {
  final EmployeeModel employee;
  const EmployeeCardView({Key? key, required this.employee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 251, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 4),
            blurRadius: 4,
            color: Colors.black.withOpacity(.28),
          ),
        ],
      ),
      child: TextButton(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return DeleteAlertView(
                  subtitle:
                      'Are you sure, you want to delete this Employee? This action can\'t be reversed!',
                  title: 'Delete Employee',
                  action: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      Get.back();
                      SnackbarMessage().snackBarMessage(
                          'Employee deleted successfully!', context);
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 227, 0, 0),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                );
              });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Get.to(
            () => EmployeesDetailsView(
              employee: employee,
            ),
            binding: EmployeesDetailsBinding(),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.h),
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(12.h),
                    //     topRight: Radius.circular(12.h)),
                    child: Image(
                      height: 75.h,
                      width: 70.w,
                      fit: BoxFit.cover,
                      image: MemoryImage(
                        const Base64Decoder().convert(employee.image!),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${employee.fName} ${employee.lName}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          'ID: ${employee.empID}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff716A6A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Divider(
              height: 1,
              thickness: 3,
              color: Color.fromARGB(255, 226, 238, 251),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  employee.designation,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
  // borderRadius: BorderRadius.circular(12.h),
  //                   // borderRadius: BorderRadius.only(
  //                   //     topLeft: Radius.circular(12.h),
  //                   //     topRight: Radius.circular(12.h)),
  //                   child: Image(
  //                     height: 75.h,
  //                     width: 70.w,