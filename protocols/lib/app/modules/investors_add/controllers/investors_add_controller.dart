import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/custom_alert/views/custom_alert_view.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:protocols/app/modules/investors_add/controllers/investors_add_date_controller.dart';

class InvestorsAddController extends GetxController {
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

class AddInvestorsButton extends GetView {
  const AddInvestorsButton({super.key});

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
              SnackbarMessage()
                  .snackBarMessage('New investor added successfully!', context);
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
                if (Get.find<InvestorsAddController>()
                    .formKey
                    .currentState!
                    .validate()) {
                  final firstName = Get.find<InvestorsAddController>()
                      .firstNameController
                      .text
                      .trim();
                  final middleName = Get.find<InvestorsAddController>()
                      .midNameController
                      .text
                      .trim();
                  final lastName = Get.find<InvestorsAddController>()
                      .lastNameController
                      .text
                      .trim();
                  final mobNo = Get.find<InvestorsAddController>()
                      .mobNoController
                      .text
                      .trim();
                  final emailId = Get.find<InvestorsAddController>()
                      .mailIdController
                      .text
                      .trim();
                  final panNo = Get.find<InvestorsAddController>()
                      .panNoController
                      .text
                      .trim();
                  final fatherName = Get.find<InvestorsAddController>()
                      .fatherNameController
                      .text
                      .trim();
                  final address = Get.find<InvestorsAddController>()
                      .addressController
                      .text
                      .trim();
                  if (Get.find<InvestorsAddController>().img == null) {
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
                                Get.find<InvestorsAddController>().pickimage();
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
                    final director = InvestorsModel(
                      middleName,
                      lastName,
                      fName: firstName,
                      image: Get.find<InvestorsAddController>().img!,
                      dob: Get.find<InvestorsAddDateController>()
                          .pickedDatePersonal
                          .toString()
                          .substring(0, 10),
                      mobNo: mobNo,
                      panNo: panNo,
                      address: address,
                      emailID: emailId,
                      fatherName: fatherName,
                    );

                    Get.find<InvestorsController>().add(director);
                    Get.find<InvestorsController>().update();
                    Get.back();
                    SnackbarMessage().snackBarMessage(
                        'New investor added successfully!', context);
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
