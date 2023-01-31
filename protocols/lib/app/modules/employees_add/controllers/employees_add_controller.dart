import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/custom_alert/views/custom_alert_view.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_add/controllers/employee_add_date_controller.dart';

class EmployeesAddController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController midNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController empIdController = TextEditingController();
  TextEditingController pfAccNoController = TextEditingController();
  TextEditingController workLocController = TextEditingController();
  TextEditingController uanNoController = TextEditingController();
  TextEditingController esiNoController = TextEditingController();

  TextEditingController mobNoController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController mailIdController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController accHolderNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController payModeController = TextEditingController();
  TextEditingController accTypeController = TextEditingController();
  TextEditingController accNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  RxString imageShow = ''.obs;
  XFile? pickedImage;
  String? img;

  pickimage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    } else {
      imageShow.value = pickedImage!.path;
      final imgBytes = File(pickedImage!.path).readAsBytesSync();
      img = base64Encode(imgBytes);
      update();
    }
  }
}

class AddEmployeeButton extends GetView<EmployeesAddController> {
  const AddEmployeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 23.w,
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            label: Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                if (Get.find<EmployeesAddController>()
                    .formKey
                    .currentState!
                    .validate()) {
                  final firstName = Get.find<EmployeesAddController>()
                      .firstNameController
                      .text
                      .trim();
                  final middleName = Get.find<EmployeesAddController>()
                      .midNameController
                      .text
                      .trim();
                  final lastName = Get.find<EmployeesAddController>()
                      .lastNameController
                      .text
                      .trim();
                  final designation = Get.find<EmployeesAddController>()
                      .designationController
                      .text
                      .trim();
                  final empID = Get.find<EmployeesAddController>()
                      .empIdController
                      .text
                      .trim();
                  final pafNo = Get.find<EmployeesAddController>()
                      .pfAccNoController
                      .text
                      .trim();
                  final uanNo = Get.find<EmployeesAddController>()
                      .uanNoController
                      .text
                      .trim();
                  final esiNo = Get.find<EmployeesAddController>()
                      .esiNoController
                      .text
                      .trim();
                  final location = Get.find<EmployeesAddController>()
                      .workLocController
                      .text
                      .trim();
                  final mobNo = Get.find<EmployeesAddController>()
                      .mobNoController
                      .text
                      .trim();
                  final emailId = Get.find<EmployeesAddController>()
                      .mailIdController
                      .text
                      .trim()
                      .toLowerCase();
                  final panNo = Get.find<EmployeesAddController>()
                      .panNoController
                      .text
                      .trim();
                  final fatherName = Get.find<EmployeesAddController>()
                      .fatherNameController
                      .text
                      .trim();
                  final address = Get.find<EmployeesAddController>()
                      .addressController
                      .text
                      .trim();
                  final paymentMode = Get.find<EmployeesAddController>()
                      .payModeController
                      .text
                      .trim();
                  final accNo = Get.find<EmployeesAddController>()
                      .accNoController
                      .text
                      .trim();
                  final acName = Get.find<EmployeesAddController>()
                      .accHolderNameController
                      .text
                      .trim();
                  final bankName = Get.find<EmployeesAddController>()
                      .bankNameController
                      .text
                      .trim();
                  final acType = Get.find<EmployeesAddController>()
                      .accTypeController
                      .text
                      .trim();
                  final ifsc = Get.find<EmployeesAddController>()
                      .ifscController
                      .text
                      .trim();
                  if (Get.find<EmployeesAddController>().img == null) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlert(
                            content: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
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
                    final employee = EmployeeModel(
                      Get.find<EmployeesAddController>().img,
                      (pafNo.isNotEmpty) ? pafNo : 'Nil',
                      middleName,
                      lastName,
                      (uanNo.isNotEmpty) ? uanNo : 'Nil',
                      (esiNo.isNotEmpty) ? esiNo : 'Nil',
                      fName: firstName,
                      designation: designation,
                      empID: empID,
                      joiningDate: Get.find<EmployeeAddDateController>()
                          .pickedDateWork
                          .toString()
                          .substring(0, 10),
                      location: location,
                      dob: Get.find<EmployeeAddDateController>()
                          .pickedDatePersonal
                          .toString()
                          .substring(0, 10),
                      mobNo: mobNo,
                      panNo: panNo,
                      payment: paymentMode,
                      accHolder: acName,
                      bankName: bankName,
                      accNo: accNo,
                      accType: acType,
                      ifsc: ifsc,
                      address: address,
                      emailID: emailId,
                      fatherName: fatherName,
                    );

                    Get.find<EmployeesController>().add(employee);
                    Get.find<EmployeesController>().update();
                    Get.back();
                    SnackbarMessage().snackBarMessage(
                        'New employee added successfully!', context);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 30.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
