import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_date_controller.dart';
import 'package:protocols/app/modules/employees_edit/views/employees_edit_field_pr_py_details_view.dart';
import 'package:protocols/app/modules/employees_edit/views/employees_edit_field_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesEditView extends GetView<EmployeesEditController> {
  final EmployeeModel employee;
  const EmployeesEditView({Key? key, required this.employee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initValues();
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20.0),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Center(
                child: Text(
                  'Edit Employee',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Obx(() => (Get.find<EmployeesEditController>()
                      .imageSample
                      .value
                      .isNotEmpty)
                  ? ImageDisplayEdit(
                      image: FileImage(File(Get.find<EmployeesEditController>()
                          .imageSample
                          .value)),
                      pickMedia: InkWell(
                          child: const Icon(
                            Icons.face_retouching_natural_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                          onTap: () {
                            Get.find<EmployeesEditController>().pickImageEdit();
                          }))
                  :
                  // : (Get.find<EmployeesEditController>().assetImage.isEmpty)
                  //     ?
                  ImageDisplayEdit(
                      image: MemoryImage(
                        const Base64Decoder().convert(employee.image!),
                      ),
                      pickMedia: InkWell(
                          child: const Icon(
                            Icons.face_retouching_natural_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                          onTap: () {
                            Get.find<EmployeesEditController>().pickImageEdit();
                          }),
                    )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 7),
                child: const Text(
                  'Work Details',
                  style: TextStyle(fontSize: 19, fontFamily: 'Montserrat Bold'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Form(
                key: Get.find<EmployeesEditController>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmployeesEditFieldView(
                      date: employee.joiningDate,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 7,
                        top: MediaQuery.of(context).size.height / 20,
                      ),
                      child: const Text(
                        'Personal Details',
                        style: TextStyle(
                            fontSize: 19, fontFamily: 'Montserrat Bold'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    EmployeesEditFieldPersonalDetailsView(date: employee.dob),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 7,
                        top: MediaQuery.of(context).size.height / 20,
                      ),
                      child: const Text(
                        'Payment Details',
                        style: TextStyle(
                            fontSize: 19, fontFamily: 'Montserrat Bold'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const EmployeeEditFieldPaymentDetailsView()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const EditEmployeeButton(),
    );
  }

  initValues() {
    final jd = DateTime.parse(employee.joiningDate);
    Get.find<EmployeesEditDateController>().initDateWork(jd);
    final dob = DateTime.parse(employee.dob);
    Get.find<EmployeesEditDateController>().initDatePersonal(dob);
    Get.find<EmployeesEditController>().accHolderNameController.text =
        employee.accHolder;
    Get.find<EmployeesEditController>().accNoController.text = employee.accNo;
    Get.find<EmployeesEditController>().accTypeController.text =
        employee.accType;
    Get.find<EmployeesEditController>().addressController.text =
        employee.address;
    Get.find<EmployeesEditController>().bankNameController.text =
        employee.bankName;
    Get.find<EmployeesEditController>().empIdController.text = employee.empID;
    Get.find<EmployeesEditController>().esiNoController.text = employee.esiNo!;
    Get.find<EmployeesEditController>().fatherNameController.text =
        employee.fatherName;
    Get.find<EmployeesEditController>().firstNameController.text =
        employee.fName;
    Get.find<EmployeesEditController>().ifscController.text = employee.ifsc;
    Get.find<EmployeesEditController>().lastNameController.text =
        employee.lName!;
    Get.find<EmployeesEditController>().mailIdController.text =
        employee.emailID;
    Get.find<EmployeesEditController>().midNameController.text =
        employee.mName!;
    Get.find<EmployeesEditController>().designationController.text =
        employee.designation;
    Get.find<EmployeesEditController>().mobNoController.text = employee.mobNo;
    Get.find<EmployeesEditController>().panNoController.text = employee.panNo;
    Get.find<EmployeesEditController>().payModeController.text =
        employee.payment;
    Get.find<EmployeesEditController>().pfAccNoController.text =
        employee.pfAcNo!;
    Get.find<EmployeesEditController>().uanNoController.text = employee.uanNo!;
    Get.find<EmployeesEditController>().workLocController.text =
        employee.location;
  }
}


 // : ImageDisplay(
                  //     image: MemoryImage(
                  //       const Base64Decoder()
                  //           .convert(Get.find<EmployeesEditController>().assetImage),
                  //     ),
                  //     pickMedia: InkWell(
                  //         child: const Icon(
                  //           Icons.face_retouching_natural_rounded,
                  //           color: Colors.white,
                  //           size: 22,
                  //         ),
                  //         onTap: () {
                  //           Get.find<EmployeesEditController>().pickimage();
                  //         }),
                  //   ),