import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/investors_add/controllers/investors_add_controller.dart';
import 'package:protocols/app/modules/investors_add/controllers/investors_add_date_controller.dart';

class InvestorsAddFieldView extends GetView<InvestorsAddController>
    with InputValidationMixin {
  const InvestorsAddFieldView({Key? key}) : super(key: key);
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
            contrlr: Get.find<InvestorsAddController>().firstNameController,
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
            controller: Get.find<InvestorsAddController>().midNameController,
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
            controller: Get.find<InvestorsAddController>().lastNameController,
            keyboardType: TextInputType.name,
            decoration: TextDecoEmp().lastNameDeco,
            cursorColor: Colors.grey[600],
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            validate: isEmailValid,
            contrlr: Get.find<InvestorsAddController>().mailIdController,
            required: 'Mail ID',
            type: TextInputType.emailAddress,
            deco: TextDecoEmp().mailIdDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            validate: isPhNoValid,
            contrlr: Get.find<InvestorsAddController>().mobNoController,
            required: 'Mobile Number',
            type: TextInputType.phone,
            deco: TextDecoEmp().mobNoDeco,
          ),
          DatePickInvestorsPeronalCardAdd(
            icon: Icons.calendar_today,
            subTitle: 'Date of Birth',
            title: Obx(
              () => Text(
                "${Get.find<InvestorsAddDateController>().todayDatePersonal.value} ${Get.find<InvestorsAddDateController>().todayMonthPersonal.value} '${Get.find<InvestorsAddDateController>().yrShortPersonal.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isNameValid,
            contrlr: Get.find<InvestorsAddController>().fatherNameController,
            required: 'Father Name',
            type: TextInputType.name,
            deco: TextDecoEmp().fatherNameDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            validate: isPanNoValid,
            contrlr: Get.find<InvestorsAddController>().panNoController,
            required: 'PAN No.',
            type: TextInputType.text,
            deco: TextDecoEmp().panNoDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isAddressValid,
            contrlr: Get.find<InvestorsAddController>().addressController,
            required: 'Address',
            type: TextInputType.streetAddress,
            deco: TextDecoEmp().addressDeco,
          ),
        ],
      ),
    );
  }
}
