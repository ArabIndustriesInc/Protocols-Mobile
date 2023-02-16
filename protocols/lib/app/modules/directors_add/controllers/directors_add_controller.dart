import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protocols/app/data/models/directors_model.dart';
import 'package:protocols/app/data/providers/directors_provider.dart';
import 'package:protocols/app/modules/custom_alert/views/custom_alert_view.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_date_controller.dart';
import 'package:protocols/app/routes/app_pages.dart';

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
  var loadingAdd = false.obs;
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
  final String action;
  const AddDirectorsButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (action == 'add')
              ? ElevatedButton.icon(
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
                )
              : const SizedBox(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                if (action == 'add' &&
                    !Get.find<DirectorsAddController>().loadingAdd.value) {
                  if (Get.find<DirectorsAddController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    Get.find<DirectorsAddController>().loadingAdd.value = true;
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
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
                                  Get.find<DirectorsAddController>()
                                      .pickimage();
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
                      final img =
                          Get.find<DirectorsAddController>().pickedImage;
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
                      final filename =
                          Get.find<DirectorsAddController>().pickedImage!.name;
                      DirectorsProvider()
                          .addDirector(director, filename, context);
                    }
                  }
                } else {
                  Get.toNamed(Routes.HOME);
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Obx(() {
                return (Get.find<DirectorsAddController>().loadingAdd.value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.7,
                        ),
                      )
                    : Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 30.h,
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
