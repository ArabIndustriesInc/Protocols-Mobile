import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/directors_edit.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_controller.dart';
import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_date_controller.dart';

class DirectorsEditFieldView extends GetView<DirectorsEditController>
    with InputValidationMixin {
  final String date;
  const DirectorsEditFieldView({Key? key, required this.date})
      : super(key: key);
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
            contrlr: Get.find<DirectorsEditController>().firstNameController,
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
            controller: Get.find<DirectorsEditController>().midNameController,
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
            controller: Get.find<DirectorsEditController>().lastNameController,
            keyboardType: TextInputType.name,
            decoration: TextDecoEmp().lastNameDeco,
            cursorColor: Colors.grey[600],
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            validate: isEmailValid,
            contrlr: Get.find<DirectorsEditController>().mailIdController,
            required: 'Mail ID',
            type: TextInputType.emailAddress,
            deco: TextDecoEmp().mailIdDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            validate: isPhNoValid,
            contrlr: Get.find<DirectorsEditController>().mobNoController,
            required: 'Mobile Number',
            type: TextInputType.phone,
            deco: TextDecoEmp().mobNoDeco,
          ),
          DatePickDirectorsEdit(
            icon: Icons.calendar_today,
            subTitle: 'Date of Birth',
            title: Obx(
              () => Text(
                "${Get.find<DirectorsEditDateController>().todayDatePersonal.value} ${Get.find<DirectorsEditDateController>().todayMonthPersonal.value} '${Get.find<DirectorsEditDateController>().yrShortPersonal.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            date: date,
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isNameValid,
            contrlr: Get.find<DirectorsEditController>().fatherNameController,
            required: 'Father Name',
            type: TextInputType.name,
            deco: TextDecoEmp().fatherNameDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            validate: isPanNoValid,
            contrlr: Get.find<DirectorsEditController>().panNoController,
            required: 'PAN No.',
            type: TextInputType.text,
            deco: TextDecoEmp().panNoDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isAddressValid,
            contrlr: Get.find<DirectorsEditController>().addressController,
            required: 'Address',
            type: TextInputType.streetAddress,
            deco: TextDecoEmp().addressDeco,
          ),
        ],
      ),
    );
  }
}
