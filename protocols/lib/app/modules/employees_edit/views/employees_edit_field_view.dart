import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_date_controller.dart';

class EmployeesEditFieldView extends GetView<EmployeesEditDateController>
    with InputValidationMixin {
  final String date;
  const EmployeesEditFieldView({Key? key, required this.date})
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
            contrlr: Get.find<EmployeesEditController>().firstNameController,
            type: TextInputType.name,
            required: 'First Name',
            validate: isNameValid,
            deco: TextDecoEmp().firstNameDeco,
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: Get.find<EmployeesEditController>().midNameController,
            keyboardType: TextInputType.name,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isNameValid(value)) {
                return "Invalid Name! Enter valid one";
              } else {
                return null;
              }
            }),
            decoration: TextDecoEmp().midNameDeco,
            cursorColor: Colors.grey[600],
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: Get.find<EmployeesEditController>().lastNameController,
            keyboardType: TextInputType.name,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isNameValid(value)) {
                return "Invalid Name! Enter valid one";
              } else {
                return null;
              }
            }),
            decoration: TextDecoEmp().lastNameDeco,
            cursorColor: Colors.grey[600],
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesEditController>().designationController,
            type: TextInputType.name,
            required: 'Designation',
            validate: isNameValid,
            deco: TextDecoEmp().designationDeco,
          ),
          DatePickEmployeeCardEdit(
            date: date,
            icon: Icons.calendar_today,
            subTitle: 'Joining Date',
            title: Obx(
              () => Text(
                "${Get.find<EmployeesEditDateController>().todayDateWork.value} ${Get.find<EmployeesEditDateController>().todayMonthWork.value} '${Get.find<EmployeesEditDateController>().yrShortWork.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            contrlr: Get.find<EmployeesEditController>().empIdController,
            type: TextInputType.text,
            required: 'Employee ID',
            validate: isEmpIdValid,
            deco: TextDecoEmp().empIdDeco,
          ),
          TextFormField(
            controller: Get.find<EmployeesEditController>().pfAccNoController,
            validator: ((value) {
              if (!isPfNoValid(value!)) {
                return "Invalid PF Number! Enter valid one";
              } else {
                return null;
              }
            }),
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.characters,
            decoration: TextDecoEmp().pfAccNoDeco,
            cursorColor: Colors.grey[600],
          ),
          TextFormField(
            controller: Get.find<EmployeesEditController>().uanNoController,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isPfNoValid(value)) {
                return "Invalid UAN Number! Enter valid one";
              } else {
                return null;
              }
            }),
            keyboardType: TextInputType.text,
            decoration: TextDecoEmp().uanNoDeco,
            textCapitalization: TextCapitalization.characters,
            cursorColor: Colors.grey[600],
          ),
          TextFormField(
            controller: Get.find<EmployeesEditController>().esiNoController,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isPfNoValid(value)) {
                return "Invalid ESI Number! Enter valid one";
              } else {
                return null;
              }
            }),
            keyboardType: TextInputType.text,
            decoration: TextDecoEmp().esiNoDeco,
            textCapitalization: TextCapitalization.characters,
            cursorColor: Colors.grey[600],
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesEditController>().workLocController,
            validate: isAddressValid,
            type: TextInputType.streetAddress,
            deco: TextDecoEmp().workLocDeco,
            required: 'Work Location',
          ),
        ],
      ),
    );
  }
}

class ImageDisplayEdit extends GetView {
  final ImageProvider<Object> image;
  final InkWell pickMedia;
  const ImageDisplayEdit(
      {Key? key, required this.image, required this.pickMedia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 71,
            backgroundColor: const Color(0xff2683D5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: image,
              radius: 70,
            ),
          ),
          Positioned(
            bottom: -3,
            right: -1,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Container(
                    height: 35,
                    width: 35,
                    color: const Color(0xff2683D5),
                    child: pickMedia),
              ),
            ),
          )
        ],
      ),
    );
  }
}
