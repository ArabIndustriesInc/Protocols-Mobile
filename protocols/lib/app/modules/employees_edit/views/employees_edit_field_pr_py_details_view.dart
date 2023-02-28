import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_date_controller.dart';

class EmployeesEditFieldPersonalDetailsView
    extends GetView<EmployeesEditController> with InputValidationMixin {
  final String date;
  const EmployeesEditFieldPersonalDetailsView({Key? key, required this.date})
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
            capType: TextCapitalization.none,
            contrlr: Get.find<EmployeesEditController>().mobNoController,
            type: TextInputType.phone,
            required: 'Mobile Number',
            validate: isPhNoValid,
            deco: TextDecoEmp().mobNoDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            contrlr: Get.find<EmployeesEditController>().mailIdController,
            type: TextInputType.emailAddress,
            validate: isEmailValid,
            required: 'Mail Id',
            deco: TextDecoEmp().mailIdDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            contrlr: Get.find<EmployeesEditController>().panNoController,
            type: TextInputType.text,
            validate: isPanNoValid,
            required: 'PAN Number',
            deco: TextDecoEmp().panNoDeco,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesEditController>().fatherNameController,
            type: TextInputType.name,
            validate: isNameValid,
            deco: TextDecoEmp().fatherNameDeco,
            required: 'Father\'s Name',
          ),
          DatePickEmployeePeronalCardEdit(
            date: date,
            icon: Icons.calendar_today,
            subTitle: 'Date of Birth',
            title: Obx(
              () => Text(
                "${Get.find<EmployeesEditDateController>().todayDatePersonal.value} ${Get.find<EmployeesEditDateController>().todayMonthPersonal.value} '${Get.find<EmployeesEditDateController>().yrShortPersonal.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            validate: isAddressValid,
            contrlr: Get.find<EmployeesEditController>().addressController,
            required: 'Editress',
            type: TextInputType.streetAddress,
            deco: TextDecoEmp().addressDeco,
          ),
        ],
      ),
    );
  }
}

class EmployeeEditFieldPaymentDetailsView
    extends GetView<EmployeesEditController> with InputValidationMixin {
  const EmployeeEditFieldPaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 11, vertical: 10.h),
      child: Wrap(
        runSpacing: 20.h,
        children: [
          EmpDrsInvTextField(
            capType: TextCapitalization.sentences,
            contrlr: Get.find<EmployeesEditController>().payModeController,
            type: TextInputType.text,
            validate: isNameValid,
            deco: TextDecoEmp().payModeDeco,
            required: 'Payment Mode',
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr:
                Get.find<EmployeesEditController>().accHolderNameController,
            type: TextInputType.name,
            validate: isNameValid,
            deco: TextDecoEmp().accHldNameDeco,
            required: 'Account Holder Name',
          ),
          TypeAheadField(
            animationStart: 0,
            animationDuration: Duration.zero,
            textFieldConfiguration: TextFieldConfiguration(
              controller:
                  Get.find<EmployeesEditController>().bankNameController,
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
              Get.find<EmployeesEditController>().bankNameController.text =
                  suggestion;
            },
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesEditController>().accTypeController,
            type: TextInputType.name,
            validate: isNameValid,
            deco: TextDecoEmp().accTypeDeco,
            required: 'Account Type',
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.none,
            contrlr: Get.find<EmployeesEditController>().accNoController,
            type: TextInputType.number,
            validate: isAccNumberValid,
            deco: TextDecoEmp().accNoDeco,
            required: 'Account Number',
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            contrlr: Get.find<EmployeesEditController>().ifscController,
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
