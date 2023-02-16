import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/employees_model.dart';
import 'package:protocols/app/data/providers/employees_provider.dart';
import 'package:protocols/app/modules/custom_alert/views/custom_alert_view.dart';
import 'package:protocols/app/modules/employees_add/controllers/employee_add_date_controller.dart';
import 'package:protocols/app/modules/employees_add/controllers/employees_add_controller.dart';

class EmployeeAddFunction {
  final BuildContext context;

  EmployeeAddFunction({required this.context});
  validateFunction() {
    if (Get.find<EmployeesAddController>().formKey.currentState!.validate()) {
      Get.find<EmployeesAddController>().loadingAdd.value = true;
      final firstname =
          Get.find<EmployeesAddController>().firstNameController.text.trim();
      final middlename = (Get.find<EmployeesAddController>()
                  .midNameController
                  .text
                  .trim() ==
              '')
          ? 'Nil'
          : Get.find<EmployeesAddController>().midNameController.text.trim();
      final lastname =
          Get.find<EmployeesAddController>().lastNameController.text.trim();
      final position =
          Get.find<EmployeesAddController>().designationController.text.trim();
      final employeeid =
          Get.find<EmployeesAddController>().empIdController.text.trim();
      final pfaccountnumber =
          Get.find<EmployeesAddController>().pfAccNoController.text.trim();
      final uannumber =
          Get.find<EmployeesAddController>().uanNoController.text.trim();
      final esinumber =
          (Get.find<EmployeesAddController>().esiNoController.text.trim() == '')
              ? 'Nil'
              : Get.find<EmployeesAddController>().esiNoController.text.trim();
      final worklocation =
          Get.find<EmployeesAddController>().workLocController.text.trim();
      final mobile =
          Get.find<EmployeesAddController>().mobNoController.text.trim();
      final email = Get.find<EmployeesAddController>()
          .mailIdController
          .text
          .trim()
          .toLowerCase();
      final pannumber =
          Get.find<EmployeesAddController>().panNoController.text.trim();
      final fathersname =
          Get.find<EmployeesAddController>().fatherNameController.text.trim();
      final address =
          Get.find<EmployeesAddController>().addressController.text.trim();
      final paymentMode =
          Get.find<EmployeesAddController>().payModeController.text.trim();
      final accNo =
          Get.find<EmployeesAddController>().accNoController.text.trim();
      final accName = Get.find<EmployeesAddController>()
          .accHolderNameController
          .text
          .trim();
      final bank =
          Get.find<EmployeesAddController>().bankNameController.text.trim();
      final type =
          Get.find<EmployeesAddController>().accTypeController.text.trim();
      final ifsc =
          Get.find<EmployeesAddController>().ifscController.text.trim();
      if (Get.find<EmployeesAddController>().img == null) {
        showDialog(
            context: context,
            builder: (context) {
              return CustomAlert(
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'You did not pick an image! Please select an image to continue.',
                    style: TextStyle(fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: const Color.fromARGB(255, 222, 15, 0),
                title: 'Warning!',
                action: InkWell(
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    Get.find<EmployeesAddController>().pickimage();
                    Get.back();
                  },
                  child: Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              );
            });
      } else {
        final img = Get.find<EmployeesAddController>().pickedImage;
        final employee = AddEmployees(
          middlename: middlename,
          esinumber: esinumber,
          firstname: firstname,
          lastname: lastname,
          joiningdate: Get.find<EmployeeAddDateController>()
              .pickedDateWork
              .toString()
              .substring(0, 10),
          employeeid: employeeid,
          worklocation: worklocation,
          uannumber: uannumber,
          image: File(img!.path),
          dob: Get.find<EmployeeAddDateController>()
              .pickedDatePersonal
              .toString()
              .substring(0, 10),
          mobile: mobile,
          email: email,
          pannumber: pannumber,
          fathersname: fathersname,
          address: address,
          paymentMode: paymentMode,
          bank: bank,
          type: type,
          ifsc: ifsc,
          accName: accName,
          accNo: accNo,
          position: position,
          pfaccountnumber: pfaccountnumber,
        );
        final filename = Get.find<EmployeesAddController>().pickedImage!.name;
        EmployeesProvider().addEmployee(employee, filename, context);
      }
    }
  }
}
