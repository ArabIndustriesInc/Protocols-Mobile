// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/profile_model.dart';
import 'package:protocols/app/data/providers/profile_provider.dart';
import 'package:protocols/app/modules/home/controllers/home_controller.dart';
import 'package:protocols/app/modules/settings/bindings/settings_binding.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';
import 'package:protocols/app/modules/settings/controllers/settings_date_controller.dart';
import 'package:protocols/app/modules/settings/views/settings_edit_view.dart';

class SettingsButtonView extends GetView<SettingsDateController> {
  const SettingsButtonView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.h, right: 25.h, bottom: 20.h, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18),
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
                if (!Get.find<SettingsController>().loading.value &&
                    Get.find<SettingsController>().profile.value.firstname !=
                        '') {
                  Get.to(() => const SettingsEditView(),
                      binding: SettingsEditBinding());
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(12.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                FontAwesomeIcons.userPen,
                color: Colors.white,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsEditButton extends GetView {
  const SettingsEditButton({super.key});

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
                if (!Get.find<SettingsDateController>().loadingEdit.value) {
                  if (Get.find<SettingsDateController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    final documentDirectory = Get.find<HomeController>().dir!;
                    Get.find<SettingsDateController>().loadingEdit.value = true;
                    final firstName = Get.find<SettingsDateController>()
                        .firstNameController
                        .text
                        .trim();
                    final middleName = Get.find<SettingsDateController>()
                        .midNameController
                        .text
                        .trim();
                    final lastName = Get.find<SettingsDateController>()
                        .lastNameController
                        .text
                        .trim();
                    final mobNo = Get.find<SettingsDateController>()
                        .mobNoController
                        .text
                        .trim();
                    final emailId = Get.find<SettingsDateController>()
                        .mailIdController
                        .text
                        .trim();
                    final panNo = Get.find<SettingsDateController>()
                        .panNoController
                        .text
                        .trim();
                    final fatherName = Get.find<SettingsDateController>()
                        .fatherNameController
                        .text
                        .trim();
                    final address = Get.find<SettingsDateController>()
                        .addressController
                        .text
                        .trim();

                    final String imageName = Get.find<SettingsController>()
                        .profile
                        .value
                        .image
                        .split('/')
                        .last;
                    final response = await http.get(Uri.parse(
                        Get.find<SettingsController>().profile.value.image));

                    final newfile =
                        File(path.join(documentDirectory.path, imageName));

                    newfile.writeAsBytesSync(response.bodyBytes);
                    final file =
                        (Get.find<SettingsDateController>().img == null)
                            ? newfile
                            : File(Get.find<SettingsDateController>()
                                .pickedImage!
                                .path);

                    final profile = AddProfile(
                      firstname: firstName,
                      lastname: lastName,
                      middlename: middleName,
                      email: emailId,
                      mobile: mobNo,
                      dob: Get.find<SettingsDateController>()
                          .pickedDatePersonal
                          .toString()
                          .substring(0, 10),
                      pannumber: panNo,
                      fathersname: fatherName,
                      address: address,
                      image: file,
                    );
                    final filename = path.basename(file.path);
                    Get.find<SettingsDateController>().deleteFile =
                        newfile.path;
                    ProfileProvider().editProfile(profile, filename, context);
                    Get.find<SettingsDateController>().deleteFile =
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
                return (Get.find<SettingsDateController>().loadingEdit.value)
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
