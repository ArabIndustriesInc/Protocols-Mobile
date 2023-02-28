// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:protocols/app/data/models/investors_model.dart';
import 'package:protocols/app/data/providers/investors_provider.dart';
import 'package:protocols/app/modules/home/controllers/home_controller.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:protocols/app/modules/investors_edit/controllers/investors_edit_date_controller.dart';

class InvestorsEditController extends GetxController {
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

  @override
  void onClose() {
    InvestorsProvider.isFinishedInvestors = true;
    InvestorsProvider().onClose();
    super.onClose();
  }
}

class InvestorsEditButton extends GetView {
  final int index;
  const InvestorsEditButton({super.key, required this.index});

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
              onPressed: () async {
                if (!Get.find<InvestorsEditController>().loadingEdit.value) {
                  if (Get.find<InvestorsEditController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    final documentDirectory = Get.find<HomeController>().dir;
                    Get.find<InvestorsEditController>().loadingEdit.value =
                        true;
                    final firstName = Get.find<InvestorsEditController>()
                        .firstNameController
                        .text
                        .trim();
                    final middleName = Get.find<InvestorsEditController>()
                        .midNameController
                        .text
                        .trim();
                    final lastName = Get.find<InvestorsEditController>()
                        .lastNameController
                        .text
                        .trim();
                    final mobNo = Get.find<InvestorsEditController>()
                        .mobNoController
                        .text
                        .trim();
                    final emailId = Get.find<InvestorsEditController>()
                        .mailIdController
                        .text
                        .trim();
                    final panNo = Get.find<InvestorsEditController>()
                        .panNoController
                        .text
                        .trim();
                    final fatherName = Get.find<InvestorsEditController>()
                        .fatherNameController
                        .text
                        .trim();
                    final address = Get.find<InvestorsEditController>()
                        .addressController
                        .text
                        .trim();

                    final String imageName = Get.find<InvestorsController>()
                        .investors[index]
                        .image
                        .split('/')
                        .last;
                    final response = await http.get(Uri.parse(
                        Get.find<InvestorsController>()
                            .investors[index]
                            .image));

                    final newfile =
                        File(path.join(documentDirectory!.path, imageName));

                    newfile.writeAsBytesSync(response.bodyBytes);
                    final file =
                        (Get.find<InvestorsEditController>().pickedImage ==
                                null)
                            ? newfile
                            : File(Get.find<InvestorsEditController>()
                                .pickedImage!
                                .path);
                    log(file.path);

                    final investor = AddInvestors(
                      firstname: firstName,
                      lastname: lastName,
                      middlename: middleName,
                      email: emailId,
                      mobile: mobNo,
                      dob: Get.find<InvestorsEditDateController>()
                          .pickedDatePersonal
                          .toString()
                          .substring(0, 10),
                      pannumber: panNo,
                      fathersname: fatherName,
                      address: address,
                      image: file,
                    );
                    final id =
                        Get.find<InvestorsController>().investors[index].id;
                    final filename = path.basename(file.path);
                    Get.find<InvestorsEditController>().deleteFile =
                        newfile.path;
                    await InvestorsProvider()
                        .editInvestor(investor, filename, id, context);
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
                return (Get.find<InvestorsEditController>().loadingEdit.value)
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
