import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/directors_model.dart';
import 'package:protocols/app/data/providers/directors_provider.dart';
import 'package:protocols/app/modules/custom_alert/views/custom_alert_view.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_controller.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_date_controller.dart';

class DirectorsAddFunctions {
  addFunction(BuildContext context) {
    if (Get.find<DirectorsAddController>().formKey.currentState!.validate()) {
      Get.find<DirectorsAddController>().loadingAdd.value = true;
      final firstName =
          Get.find<DirectorsAddController>().firstNameController.text.trim();
      final middleName =
          Get.find<DirectorsAddController>().midNameController.text.trim();
      final lastName =
          Get.find<DirectorsAddController>().lastNameController.text.trim();
      final mobNo =
          Get.find<DirectorsAddController>().mobNoController.text.trim();
      final emailId =
          Get.find<DirectorsAddController>().mailIdController.text.trim();
      final panNo =
          Get.find<DirectorsAddController>().panNoController.text.trim();
      final fatherName =
          Get.find<DirectorsAddController>().fatherNameController.text.trim();
      final address =
          Get.find<DirectorsAddController>().addressController.text.trim();
      if (Get.find<DirectorsAddController>().img == null) {
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
                    Get.find<DirectorsAddController>().pickimage();
                    Get.back();
                  },
                  child: Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              );
            });
      } else {
        final img = Get.find<DirectorsAddController>().pickedImage;
        final director = AddDirectors(
          firstname: firstName,
          lastname: lastName,
          middlename: middleName,
          email: emailId,
          mobile: mobNo,
          dob: Get.find<DirectorsAddDateController>()
              .pickedDatePersonal
              .toString()
              .substring(0, 10),
          pannumber: panNo,
          fathersname: fatherName,
          address: address,
          image: File(img!.path),
        );
        final filename = Get.find<DirectorsAddController>().pickedImage!.name;
        DirectorsProvider().addDirector(director, filename, context);
      }
    }
  }

  addProfile(BuildContext context) {
    if (Get.find<DirectorsAddController>().formKey.currentState!.validate()) {
      Get.find<DirectorsAddController>().loadingAdd.value = true;
      final firstName =
          Get.find<DirectorsAddController>().firstNameController.text.trim();
      final middleName =
          Get.find<DirectorsAddController>().midNameController.text.trim();
      final lastName =
          Get.find<DirectorsAddController>().lastNameController.text.trim();
      final mobNo =
          Get.find<DirectorsAddController>().mobNoController.text.trim();
      final emailId =
          Get.find<DirectorsAddController>().mailIdController.text.trim();
      final panNo =
          Get.find<DirectorsAddController>().panNoController.text.trim();
      final fatherName =
          Get.find<DirectorsAddController>().fatherNameController.text.trim();
      final address =
          Get.find<DirectorsAddController>().addressController.text.trim();
      if (Get.find<DirectorsAddController>().img == null) {
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
                    Get.find<DirectorsAddController>().pickimage();
                    Get.back();
                  },
                  child: Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              );
            });
      } else {
        final img = Get.find<DirectorsAddController>().pickedImage;
        final director = AddDirectors(
          firstname: firstName,
          lastname: lastName,
          middlename: middleName,
          email: emailId,
          mobile: mobNo,
          dob: Get.find<DirectorsAddDateController>()
              .pickedDatePersonal
              .toString()
              .substring(0, 10),
          pannumber: panNo,
          fathersname: fatherName,
          address: address,
          image: File(img!.path),
        );
        final filename = Get.find<DirectorsAddController>().pickedImage!.name;
        DirectorsProvider().addDirectorProfile(director, filename, context);
      }
    }
  }
}
