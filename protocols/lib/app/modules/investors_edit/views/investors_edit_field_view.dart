import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/directors_edit.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/investors_edit/controllers/investors_edit_controller.dart';
import 'package:protocols/app/modules/investors_edit/controllers/investors_edit_date_controller.dart';

class InvestorsEditFieldView extends GetView<InvestorsEditController>
    with InputValidationMixin {
  final String date;
  const InvestorsEditFieldView({Key? key, required this.date})
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
            contrlr: Get.find<InvestorsEditController>().firstNameController,
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
            controller: Get.find<InvestorsEditController>().midNameController,
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
            controller: Get.find<InvestorsEditController>().lastNameController,
            keyboardType: TextInputType.name,
            decoration: TextDecoEmp().lastNameDeco,
            cursorColor: Colors.grey[600],
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            validate: isEmailValid,
            contrlr: Get.find<InvestorsEditController>().mailIdController,
            required: 'Mail ID',
            type: TextInputType.emailAddress,
            deco: TextDecoEmp().mailIdDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            validate: isPhNoValid,
            contrlr: Get.find<InvestorsEditController>().mobNoController,
            required: 'Mobile Number',
            type: TextInputType.phone,
            deco: TextDecoEmp().mobNoDeco,
          ),
          DatePickDirectorsEdit(
            icon: Icons.calendar_today,
            subTitle: 'Date of Birth',
            title: Obx(
              () => Text(
                "${Get.find<InvestorsEditDateController>().todayDatePersonal.value} ${Get.find<InvestorsEditDateController>().todayMonthPersonal.value} '${Get.find<InvestorsEditDateController>().yrShortPersonal.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            date: date,
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isNameValid,
            contrlr: Get.find<InvestorsEditController>().fatherNameController,
            required: 'Father Name',
            type: TextInputType.name,
            deco: TextDecoEmp().fatherNameDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            validate: isPanNoValid,
            contrlr: Get.find<InvestorsEditController>().panNoController,
            required: 'PAN No.',
            type: TextInputType.text,
            deco: TextDecoEmp().panNoDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isAddressValid,
            contrlr: Get.find<InvestorsEditController>().addressController,
            required: 'Address',
            type: TextInputType.streetAddress,
            deco: TextDecoEmp().addressDeco,
          ),
        ],
      ),
    );
  }
}
