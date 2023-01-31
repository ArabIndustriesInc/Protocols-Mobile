import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/custom_alert/views/custom_alert_view.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_date_controller.dart';

class DirectorsAddController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController midNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController mailIdController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxString image = ''.obs;
  RxString imageSample = ''.obs;
  XFile? pickedImage;
  String? img;

  pickimage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    } else {
      imageSample.value = pickedImage!.path;
      final imgBytes = File(pickedImage!.path).readAsBytesSync();
      img = base64Encode(imgBytes);
      update();
    }
  }
}

class AddDirectorsButton extends GetView {
  const AddDirectorsButton({super.key});

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
                if (Get.find<DirectorsAddController>()
                    .formKey
                    .currentState!
                    .validate()) {
                  final firstName = Get.find<DirectorsAddController>()
                      .firstNameController
                      .text
                      .trim();
                  final middleName = Get.find<DirectorsAddController>()
                      .midNameController
                      .text
                      .trim();
                  final lastName = Get.find<DirectorsAddController>()
                      .lastNameController
                      .text
                      .trim();
                  final mobNo = Get.find<DirectorsAddController>()
                      .mobNoController
                      .text
                      .trim();
                  final emailId = Get.find<DirectorsAddController>()
                      .mailIdController
                      .text
                      .trim();
                  final panNo = Get.find<DirectorsAddController>()
                      .panNoController
                      .text
                      .trim();
                  final fatherName = Get.find<DirectorsAddController>()
                      .fatherNameController
                      .text
                      .trim();
                  final address = Get.find<DirectorsAddController>()
                      .addressController
                      .text
                      .trim();
                  if (Get.find<DirectorsAddController>().img == null) {
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
                    final director = DirectorsModel(
                      middleName,
                      lastName,
                      fName: firstName,
                      image: Get.find<DirectorsAddController>().img!,
                      dob: Get.find<DirectorsAddDateController>()
                          .pickedDatePersonal
                          .toString()
                          .substring(0, 10),
                      mobNo: mobNo,
                      panNo: panNo,
                      address: address,
                      emailID: emailId,
                      fatherName: fatherName,
                    );

                    Get.find<DirectorsController>().add(director);
                    Get.find<DirectorsController>().update();
                    SnackbarMessage().snackBarMessage(
                        'New Director added successfully!', context);
                    Get.back();
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
