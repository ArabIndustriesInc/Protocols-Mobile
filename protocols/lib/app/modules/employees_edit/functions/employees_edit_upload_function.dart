// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/employees_model.dart';
import 'package:protocols/app/data/providers/employees_provider.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_date_controller.dart';
import 'package:protocols/app/modules/home/controllers/home_controller.dart';

class EmployeesServerUpload {
  final int index;
  final BuildContext context;

  EmployeesServerUpload({required this.index, required this.context});
  editFunction() async {
    if (Get.find<EmployeesEditController>().formKey.currentState!.validate()) {
      final accName = Get.find<EmployeesEditController>()
          .accHolderNameController
          .text
          .trim();
      final documentDirectory = Get.find<HomeController>().dir!;
      Get.find<EmployeesEditController>().loadingEdit.value = true;
      final accNo =
          Get.find<EmployeesEditController>().accNoController.text.trim();

      final type =
          Get.find<EmployeesEditController>().accTypeController.text.trim();

      final address =
          Get.find<EmployeesEditController>().addressController.text.trim();

      final bank =
          Get.find<EmployeesEditController>().bankNameController.text.trim();

      final employeeid =
          Get.find<EmployeesEditController>().empIdController.text.trim();

      final esinumber =
          Get.find<EmployeesEditController>().esiNoController.text.trim();

      final fathersname =
          Get.find<EmployeesEditController>().fatherNameController.text.trim();

      final firstname =
          Get.find<EmployeesEditController>().firstNameController.text.trim();

      final ifsc =
          Get.find<EmployeesEditController>().ifscController.text.trim();

      final lastname =
          Get.find<EmployeesEditController>().lastNameController.text.trim();

      final email =
          Get.find<EmployeesEditController>().mailIdController.text.trim();

      final middlename =
          Get.find<EmployeesEditController>().midNameController.text.trim();

      final position =
          Get.find<EmployeesEditController>().designationController.text.trim();

      final mobile =
          Get.find<EmployeesEditController>().mobNoController.text.trim();

      final pannumber =
          Get.find<EmployeesEditController>().panNoController.text.trim();

      final paymentMode =
          Get.find<EmployeesEditController>().payModeController.text.trim();

      final pfaccountnumber =
          Get.find<EmployeesEditController>().pfAccNoController.text.trim();

      final uannumber =
          Get.find<EmployeesEditController>().uanNoController.text.trim();

      final worklocation =
          Get.find<EmployeesEditController>().workLocController.text.trim();
      final String imageName = Get.find<EmployeesController>()
          .employees[index]
          .image
          .split('/')
          .last;
      final response = await http.get(
          Uri.parse(Get.find<EmployeesController>().employees[index].image));

      final newfile = File(path.join(documentDirectory.path, imageName));

      newfile.writeAsBytesSync(response.bodyBytes);
      final file = (Get.find<EmployeesEditController>().pickedImage == null)
          ? newfile
          : File(Get.find<EmployeesEditController>().pickedImage!.path);
      final employee = AddEmployees(
        middlename: middlename,
        esinumber: esinumber,
        firstname: firstname,
        lastname: lastname,
        joiningdate: Get.find<EmployeesEditDateController>()
            .pickedDateWork
            .toString()
            .substring(0, 10),
        employeeid: employeeid,
        worklocation: worklocation,
        uannumber: uannumber,
        image: file,
        dob: Get.find<EmployeesEditDateController>()
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
      final id = Get.find<EmployeesController>().employees[index].id;
      final filename = path.basename(file.path);
      Get.find<EmployeesEditController>().deleteFile = newfile.path;
      EmployeesProvider().editEmployee(id, employee, filename, context);
    }
  }
}
