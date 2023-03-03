import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';
import 'package:protocols/app/modules/employees_edit/functions/employees_edit_functions.dart';
import 'package:protocols/app/modules/employees_edit/views/employees_edit_field_pr_py_details_view.dart';
import 'package:protocols/app/modules/employees_edit/views/employees_edit_field_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesEditView extends GetView<EmployeesEditController> {
  final int index;
  const EmployeesEditView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Get.find<EmployeesEditController>().initTimes.value <= 1) {
      EmployeesInitValues(index: index).initValues();
    }
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
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
              Obx(
                () => (Get.find<EmployeesEditController>()
                        .imageSample
                        .value
                        .isNotEmpty)
                    ? ImageDisplayEdit(
                        image: FileImage(File(
                            Get.find<EmployeesEditController>()
                                .imageSample
                                .value)),
                        pickMedia: InkWell(
                            child: const Icon(
                              Icons.face_retouching_natural_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            onTap: () {
                              Get.find<EmployeesEditController>()
                                  .pickImageEdit();
                            }))
                    : ImageDisplayEdit(
                        image: NetworkImage(
                          Get.find<EmployeesController>()
                              .employees[index]
                              .image,
                        ),
                        pickMedia: InkWell(
                            child: const Icon(
                              Icons.face_retouching_natural_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            onTap: () {
                              Get.find<EmployeesEditController>()
                                  .pickImageEdit();
                            }),
                      ),
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
                key: Get.find<EmployeesEditController>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmployeesEditFieldView(
                      date: Get.find<EmployeesController>()
                          .employees[index]
                          .joiningdate,
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
                    EmployeesEditFieldPersonalDetailsView(
                        date: Get.find<EmployeesController>()
                            .employees[index]
                            .dob),
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
      bottomNavigationBar: EditEmployeeButton(
        index: index,
      ),
    );
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