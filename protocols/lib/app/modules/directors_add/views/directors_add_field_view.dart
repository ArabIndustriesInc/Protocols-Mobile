import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/directors_const.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_date_controller.dart';

class DirectorsAddFieldView extends GetView<DirectorsAddController>
    with InputValidationMixin {
  const DirectorsAddFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 11, vertical: 10.h),
      child: Wrap(
        runSpacing: 20.h,
        children: [
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isNameValid,
            contrlr: Get.find<DirectorsAddController>().firstNameController,
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
                return 'Invalid data! Enter a valid one';
              } else {
                return null;
              }
            },
            controller: Get.find<DirectorsAddController>().midNameController,
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
                return 'Invalid data! Enter a valid one';
              } else {
                return null;
              }
            },
            controller: Get.find<DirectorsAddController>().lastNameController,
            keyboardType: TextInputType.name,
            decoration: TextDecoEmp().lastNameDeco,
            cursorColor: Colors.grey[600],
          ),
          TextFormField(
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              } else if (!isEmailValid(value)) {
                return 'Invalid Email! Enter a valid one';
              } else {
                return null;
              }
            },
            controller: Get.find<DirectorsAddController>().mailIdController,
            keyboardType: TextInputType.emailAddress,
            decoration: TextDecoEmp().mailIdDeco,
            cursorColor: Colors.grey[600],
          ),
          // EmpDrsInvTextField(
          //   capType: TextCapitalization.none,
          //   validate: isEmailValid,
          //   contrlr: Get.find<DirectorsAddController>().mailIdController,
          //   required: 'Mail ID',
          //   type: TextInputType.emailAddress,
          //   deco: TextDecoEmp().mailIdDeco,
          // ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            validate: isPhNoValid,
            contrlr: Get.find<DirectorsAddController>().mobNoController,
            required: 'Mobile Number',
            type: TextInputType.phone,
            deco: TextDecoEmp().mobNoDeco,
          ),
          DatePickDirectorsPeronalCardAdd(
            icon: Icons.calendar_today,
            subTitle: 'Date of Birth',
            title: Obx(
              () => Text(
                "${Get.find<DirectorsAddDateController>().todayDatePersonal.value} ${Get.find<DirectorsAddDateController>().todayMonthPersonal.value} '${Get.find<DirectorsAddDateController>().yrShortPersonal.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isNameValid,
            contrlr: Get.find<DirectorsAddController>().fatherNameController,
            required: 'Father Name',
            type: TextInputType.name,
            deco: TextDecoEmp().fatherNameDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            validate: isPanNoValid,
            contrlr: Get.find<DirectorsAddController>().panNoController,
            required: 'PAN No.',
            type: TextInputType.text,
            deco: TextDecoEmp().panNoDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isAddressValid,
            contrlr: Get.find<DirectorsAddController>().addressController,
            required: 'Address',
            type: TextInputType.streetAddress,
            deco: TextDecoEmp().addressDeco,
          ),
        ],
      ),
    );
  }
}
