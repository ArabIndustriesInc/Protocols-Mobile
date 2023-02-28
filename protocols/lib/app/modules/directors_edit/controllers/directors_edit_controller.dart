// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:protocols/app/data/models/directors_model.dart';
import 'package:protocols/app/data/providers/directors_provider.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_date_controller.dart';
import 'package:protocols/app/modules/home/controllers/home_controller.dart';

class DirectorsEditController extends GetxController {
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
  var loadingEdit = false.obs;
  RxString imageSample = ''.obs;
  XFile? pickedImage;
  String? img;
  String? deleteFile;

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

class EditDirectorsButton extends GetView {
  final int index;
  const EditDirectorsButton({super.key, required this.index});

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
              onPressed: () async {
                if (!Get.find<DirectorsEditController>().loadingEdit.value) {
                  if (Get.find<DirectorsEditController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    final documentDirectory = Get.find<HomeController>().dir!;
                    Get.find<DirectorsEditController>().loadingEdit.value =
                        true;
                    final firstName = Get.find<DirectorsEditController>()
                        .firstNameController
                        .text
                        .trim();
                    final middleName = Get.find<DirectorsEditController>()
                        .midNameController
                        .text
                        .trim();
                    final lastName = Get.find<DirectorsEditController>()
                        .lastNameController
                        .text
                        .trim();
                    final mobNo = Get.find<DirectorsEditController>()
                        .mobNoController
                        .text
                        .trim();
                    final emailId = Get.find<DirectorsEditController>()
                        .mailIdController
                        .text
                        .trim();
                    final panNo = Get.find<DirectorsEditController>()
                        .panNoController
                        .text
                        .trim();
                    final fatherName = Get.find<DirectorsEditController>()
                        .fatherNameController
                        .text
                        .trim();
                    final address = Get.find<DirectorsEditController>()
                        .addressController
                        .text
                        .trim();

                    final String imageName = Get.find<DirectorsController>()
                        .directors[index]
                        .image
                        .split('/')
                        .last;
                    final response = await http.get(Uri.parse(
                        Get.find<DirectorsController>()
                            .directors[index]
                            .image));

                    final newfile =
                        File(path.join(documentDirectory.path, imageName));

                    newfile.writeAsBytesSync(response.bodyBytes);
                    final file =
                        (Get.find<DirectorsEditController>().img == null)
                            ? newfile
                            : File(Get.find<DirectorsEditController>()
                                .pickedImage!
                                .path);

                    final director = AddDirectors(
                      firstname: firstName,
                      lastname: lastName,
                      middlename: middleName,
                      email: emailId,
                      mobile: mobNo,
                      dob: Get.find<DirectorsEditDateController>()
                          .pickedDatePersonal
                          .toString()
                          .substring(0, 10),
                      pannumber: panNo,
                      fathersname: fatherName,
                      address: address,
                      image: file,
                    );
                    final id =
                        Get.find<DirectorsController>().directors[index].id;
                    final filename = path.basename(file.path);
                    Get.find<DirectorsEditController>().deleteFile =
                        newfile.path;
                    DirectorsProvider()
                        .editDirector(director, filename, id, context);
                    Get.find<DirectorsEditController>().deleteFile =
                        newfile.path;
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
              child: Obx(() {
                return (Get.find<DirectorsEditController>().loadingEdit.value)
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
