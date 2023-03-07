import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/directors_const.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/consts/settings_appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';
import 'package:protocols/app/modules/settings/controllers/settings_date_controller.dart';
import 'package:protocols/app/modules/settings/views/settings_button_view.dart';

class SettingsEditView extends GetView<SettingsDateController>
    with InputValidationMixin {
  const SettingsEditView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Center(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Obx(
                () => (Get.find<SettingsDateController>()
                        .imageSample
                        .value
                        .isNotEmpty)
                    ? ImageDisplayDirectorsAdd(
                        image: FileImage(File(Get.find<SettingsDateController>()
                            .imageSample
                            .value)),
                        pickMedia: InkWell(
                            child: const Icon(
                              Icons.face_retouching_natural_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            onTap: () {
                              Get.find<SettingsDateController>().pickimage();
                            }))
                    : ImageDisplayDirectorsAdd(
                        image: NetworkImage(
                          Get.find<SettingsController>().profile.value.image,
                        ),
                        pickMedia: InkWell(
                            child: const Icon(
                              Icons.face_retouching_natural_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            onTap: () {
                              Get.find<SettingsDateController>().pickimage();
                            }),
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 7),
                child: const Text(
                  'Personal Details',
                  style: TextStyle(fontSize: 19, fontFamily: 'Montserrat Bold'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Form(
                key: Get.find<SettingsDateController>().formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 11,
                      vertical: 10.h),
                  child: Wrap(
                    runSpacing: 20.h,
                    children: [
                      EmpDrsInvTextField(
                        capType: TextCapitalization.words,
                        validate: isNameValid,
                        contrlr: Get.find<SettingsDateController>()
                            .firstNameController,
                        required: 'First Name',
                        type: TextInputType.name,
                        deco: TextDecoEmp().firstNameDeco,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else if (!isNameValid(value)) {
                            return 'Invalid data! Enter a valid one!';
                          } else {
                            return null;
                          }
                        },
                        controller: Get.find<SettingsDateController>()
                            .midNameController,
                        keyboardType: TextInputType.name,
                        decoration: TextDecoEmp().midNameDeco,
                        cursorColor: Colors.grey[600],
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else if (!isNameValid(value)) {
                            return 'Invalid data! Enter a valid one!';
                          } else {
                            return null;
                          }
                        },
                        controller: Get.find<SettingsDateController>()
                            .lastNameController,
                        keyboardType: TextInputType.name,
                        decoration: TextDecoEmp().lastNameDeco,
                        cursorColor: Colors.grey[600],
                      ),
                      EmpDrsInvTextField(
                        capType: TextCapitalization.none,
                        validate: isEmailValid,
                        contrlr:
                            Get.find<SettingsDateController>().mailIdController,
                        required: 'Mail ID',
                        type: TextInputType.emailAddress,
                        deco: TextDecoEmp().mailIdDeco,
                      ),
                      EmpDrsInvTextField(
                        capType: TextCapitalization.none,
                        validate: isPhNoValid,
                        contrlr:
                            Get.find<SettingsDateController>().mobNoController,
                        required: 'Mobile Number',
                        type: TextInputType.phone,
                        deco: TextDecoEmp().mobNoDeco,
                      ),
                      DatePickSettingsEdit(
                        icon: Icons.calendar_today,
                        subTitle: 'Date of Birth',
                        title: Obx(
                          () => Text(
                            "${Get.find<SettingsDateController>().todayDatePersonal.value} ${Get.find<SettingsDateController>().todayMonthPersonal.value} '${Get.find<SettingsDateController>().yrShortPersonal.value}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                        date: Get.find<SettingsController>().profile.value.dob,
                        iconSize: 27,
                      ),
                      EmpDrsInvTextField(
                        capType: TextCapitalization.words,
                        validate: isNameValid,
                        contrlr: Get.find<SettingsDateController>()
                            .fatherNameController,
                        required: 'Father Name',
                        type: TextInputType.name,
                        deco: TextDecoEmp().fatherNameDeco,
                      ),
                      EmpDrsInvTextField(
                        capType: TextCapitalization.characters,
                        validate: isPanNoValid,
                        contrlr:
                            Get.find<SettingsDateController>().panNoController,
                        required: 'PAN No.',
                        type: TextInputType.text,
                        deco: TextDecoEmp().panNoDeco,
                      ),
                      EmpDrsInvTextField(
                        capType: TextCapitalization.words,
                        validate: isAddressValid,
                        contrlr: Get.find<SettingsDateController>()
                            .addressController,
                        required: 'Address',
                        type: TextInputType.streetAddress,
                        deco: TextDecoEmp().addressDeco,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SettingsEditButton(),
    );
  }
}
