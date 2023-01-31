import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/employees_add_work_details_consts.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/employees_add/controllers/employee_add_date_controller.dart';
import 'package:protocols/app/modules/employees_add/controllers/employees_add_controller.dart';

class EmployeeDetailsAddFieldView extends GetView with InputValidationMixin {
  const EmployeeDetailsAddFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 11, vertical: 10),
      child: Wrap(
        runSpacing: 18.h,
        children: [
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesAddController>().firstNameController,
            type: TextInputType.name,
            required: 'First Name',
            validate: isNameValid,
            deco: TextDecoEmp().firstNameDeco,
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: Get.find<EmployeesAddController>().midNameController,
            keyboardType: TextInputType.name,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isNameValid(value)) {
                return "Invalid data! Enter valid one";
              } else {
                return null;
              }
            }),
            decoration: TextDecoEmp().midNameDeco,
            cursorColor: Colors.grey[600],
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: Get.find<EmployeesAddController>().lastNameController,
            keyboardType: TextInputType.name,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isNameValid(value)) {
                return "Invalid data! Enter valid one";
              } else {
                return null;
              }
            }),
            decoration: TextDecoEmp().lastNameDeco,
            cursorColor: Colors.grey[600],
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.words,
            contrlr: Get.find<EmployeesAddController>().designationController,
            type: TextInputType.name,
            required: 'Designation',
            validate: isNameValid,
            deco: TextDecoEmp().designationDeco,
          ),
          DatePickEmployeeCardAdd(
            icon: Icons.calendar_today,
            subTitle: 'Joining Date',
            title: Obx(
              () => Text(
                "${Get.find<EmployeeAddDateController>().todayDateWork.value} ${Get.find<EmployeeAddDateController>().todayMonthWork.value} '${Get.find<EmployeeAddDateController>().yrShortWork.value}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            iconSize: 27,
          ),
          EmpDrsInvTextField(
            capType: TextCapitalization.characters,
            contrlr: Get.find<EmployeesAddController>().empIdController,
            type: TextInputType.text,
            required: 'Employee ID',
            validate: isEmpIdValid,
            deco: TextDecoEmp().empIdDeco,
          ),
          TextFormField(
            controller: Get.find<EmployeesAddController>().pfAccNoController,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isPfNoValid(value)) {
                return "Invalid data! Enter valid one";
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
            controller: Get.find<EmployeesAddController>().uanNoController,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isPfNoValid(value)) {
                return "Invalid data! Enter valid one";
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
            controller: Get.find<EmployeesAddController>().esiNoController,
            validator: ((value) {
              if (value!.isEmpty) {
                return null;
              } else if (!isPfNoValid(value)) {
                return "Invalid data! Enter valid one";
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
            contrlr: Get.find<EmployeesAddController>().workLocController,
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

class ImageDisplayEmployeeAdd extends GetView {
  final ImageProvider<Object> image;
  final InkWell pickMedia;
  const ImageDisplayEmployeeAdd(
      {Key? key, required this.image, required this.pickMedia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 61.h,
            backgroundColor: const Color(0xff2683D5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: image,
              radius: 60.h,
            ),
          ),
          Positioned(
            bottom: 2,
            right: -1,
            child: CircleAvatar(
              radius: 18.h,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Container(
                    height: 30.h,
                    width: 30.h,
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
