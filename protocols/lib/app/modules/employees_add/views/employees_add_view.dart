// import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees_add/controllers/employees_add_controller.dart';
import 'package:protocols/app/modules/employees_add/views/employee_add_field_pr_py_details_view.dart';
import 'package:protocols/app/modules/employees_add/views/employee_add_field_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesAddView extends GetView<EmployeesAddController> {
  const EmployeesAddView({Key? key}) : super(key: key);
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
                  'Add Employee',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Obx(() => (Get.find<EmployeesAddController>()
                          .imageShow
                          .value
                          .isNotEmpty)
                      ? ImageDisplayEmployeeAdd(
                          image: FileImage(File(
                              Get.find<EmployeesAddController>()
                                  .imageShow
                                  .value)),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<EmployeesAddController>().pickimage();
                              }))
                      :
                      // : (Get.find<EmployeesAddController>().assetImage.isEmpty)
                      //     ?
                      ImageDisplayEmployeeAdd(
                          image:
                              const AssetImage('assets/images/profile_pic.png'),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<EmployeesAddController>().pickimage();
                              }),
                        )
                  // : ImageDisplay(
                  //     image: MemoryImage(
                  //       const Base64Decoder()
                  //           .convert(Get.find<EmployeesAddController>().assetImage),
                  //     ),
                  //     pickMedia: InkWell(
                  //         child: const Icon(
                  //           Icons.face_retouching_natural_rounded,
                  //           color: Colors.white,
                  //           size: 22,
                  //         ),
                  //         onTap: () {
                  //           Get.find<EmployeesAddController>().pickimage();
                  //         }),
                  //   ),
                  ),
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
                key: Get.find<EmployeesAddController>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EmployeeDetailsAddFieldView(),
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
                    const EmployeeAddFieldPersonalDetailsView(),
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
                    const EmployeeAddFieldPaymentDetailsView()
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(() => (Get.find<EmployeesAddController>().isWarning.value)
                  ? Text(
                      Get.find<EmployeesAddController>().warning.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFD40A0A),
                      ),
                    )
                  : const SizedBox()),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AddEmployeeButton(),
    );
  }
}
