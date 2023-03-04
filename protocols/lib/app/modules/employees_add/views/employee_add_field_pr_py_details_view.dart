import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/employees_add/controllers/employee_add_date_controller.dart';
import 'package:protocols/app/modules/employees_add/controllers/employees_add_controller.dart';

class EmployeeAddFieldPersonalDetailsView extends GetView
    with InputValidationMixin {
  const EmployeeAddFieldPersonalDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 11, vertical: 10),
      child: Wrap(
        runSpacing: 18.h,
        children: [
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            contrlr: Get.find<EmployeesAddController>().mobNoController,
            type: TextInputType.phone,
            required: 'Mobile Number',
            validate: isPhNoValid,
            deco: TextDecoEmp().mobNoDeco,
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
            controller: Get.find<EmployeesAddController>().mailIdController,
            keyboardType: TextInputType.emailAddress,
            decoration: TextDecoEmp().mailIdDeco,
            cursorColor: Colors.grey[600],
          ),
          // EmpDrsInvTextField(
          //   capType: TextCapitalization.none,
          //   contrlr: Get.find<EmployeesAddController>().mailIdController,
          //   type: TextInputType.emailAddress,
          //   validate: isEmailValid,
          //   required: 'Mail ID',
          //   deco: TextDecoEmp().mailIdDeco,
          // ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            contrlr: Get.find<EmployeesAddController>().panNoController,
            type: TextInputType.text,
            validate: isPanNoValid,
            required: 'PAN Number',
            deco: TextDecoEmp().panNoDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesAddController>().fatherNameController,
            type: TextInputType.name,
            validate: isNameValid,
            deco: TextDecoEmp().fatherNameDeco,
            required: 'Father\'s Name',
          ),
          DatePickEmployeePeronalCardAdd(
            icon: Icons.calendar_today,
            subTitle: 'Date of Birth',
            title: Obx(
              () => Text(
                "${Get.find<EmployeeAddDateController>().todayDatePersonal.value} ${Get.find<EmployeeAddDateController>().todayMonthPersonal.value} '${Get.find<EmployeeAddDateController>().yrShortPersonal.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isAddressValid,
            contrlr: Get.find<EmployeesAddController>().addressController,
            required: 'Address',
            type: TextInputType.text,
            deco: TextDecoEmp().addressDeco,
          ),
        ],
      ),
    );
  }
}

class EmployeeAddFieldPaymentDetailsView extends GetView
    with InputValidationMixin {
  const EmployeeAddFieldPaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 11, vertical: 10),
      child: Wrap(
        runSpacing: 18.h,
        children: [
          EmpDrsInvTextField(
            capType: TextCapitalization.sentences,
            contrlr: Get.find<EmployeesAddController>().payModeController,
            type: TextInputType.text,
            validate: isNameValid,
            deco: TextDecoEmp().payModeDeco,
            required: 'Payment Mode',
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesAddController>().accHolderNameController,
            type: TextInputType.name,
            validate: isNameValid,
            deco: TextDecoEmp().accHldNameDeco,
            required: 'Account Holder Name',
          ),
          TypeAheadField(
            animationStart: 0,
            animationDuration: Duration.zero,
            textFieldConfiguration: TextFieldConfiguration(
              controller: Get.find<EmployeesAddController>().bankNameController,
              keyboardType: TextInputType.name,
              cursorColor: Colors.grey[600],
              decoration: TextDecoEmp().bankNameDeco,
            ),
            suggestionsBoxDecoration: EmployeeSuggetions().suggNameDeco,
            suggestionsCallback: (pattern) {
              List<String> matches = <String>[];
              matches.addAll(EmployeeSuggetions().suggestons);

              matches.retainWhere((s) {
                return s.toLowerCase().contains(pattern.toLowerCase());
              });
              return matches;
            },
            itemBuilder: (context, sone) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                child: Text(
                  sone.toString(),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Montserrat SemiBold',
                    color: Colors.black54,
                  ),
                ),
              );
            },
            onSuggestionSelected: (String suggestion) {
              Get.find<EmployeesAddController>().bankNameController.text =
                  suggestion;
            },
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            contrlr: Get.find<EmployeesAddController>().accTypeController,
            type: TextInputType.name,
            validate: isNameValid,
            deco: TextDecoEmp().accTypeDeco,
            required: 'Account Type',
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            contrlr: Get.find<EmployeesAddController>().accNoController,
            type: TextInputType.number,
            validate: isAccNumberValid,
            deco: TextDecoEmp().accNoDeco,
            required: 'Account Number',
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            contrlr: Get.find<EmployeesAddController>().ifscController,
            type: TextInputType.text,
            validate: isIfscValid,
            deco: TextDecoEmp().ifscDeco,
            required: 'IFSC Code',
          ),
        ],
      ),
    );
  }
}
