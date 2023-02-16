import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/directors_const.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_controller.dart';
import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_date_controller.dart';
import 'package:protocols/app/modules/directors_edit/views/directors_edit_field_view.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';

class DirectorsEditView extends GetView<DirectorsEditController> {
  final int index;
  const DirectorsEditView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initValues();
    return Scaffold(
      appBar: AppBarCustom().appBar,
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
                  'Edit Directors',
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
                () => (Get.find<DirectorsEditController>()
                        .imageSample
                        .value
                        .isNotEmpty)
                    ? ImageDisplayDirectorsAdd(
                        image: FileImage(File(
                            Get.find<DirectorsEditController>()
                                .imageSample
                                .value)),
                        pickMedia: InkWell(
                            child: const Icon(
                              Icons.face_retouching_natural_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            onTap: () {
                              Get.find<DirectorsEditController>().pickimage();
                            }))
                    : ImageDisplayDirectorsAdd(
                        image: NetworkImage(
                          Get.find<DirectorsController>()
                              .directors[index]
                              .image,
                        ),
                        pickMedia: InkWell(
                            child: const Icon(
                              Icons.face_retouching_natural_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            onTap: () {
                              Get.find<DirectorsEditController>().pickimage();
                            }),
                      ),
              ),
              // Obx(() => (Get.find<DirectorsEditController>()
              //         .imageSample
              //         .value
              //         .isNotEmpty)
              //     ? ImageDisplayDirectorsAdd(
              //         image: FileImage(File(Get.find<DirectorsEditController>()
              //             .imageSample
              //             .value)),
              //         pickMedia: InkWell(
              //             child: const Icon(
              //               Icons.face_retouching_natural_rounded,
              //               color: Colors.white,
              //               size: 22,
              //             ),
              //             onTap: () {
              //               Get.find<DirectorsEditController>().pickimage();
              //             }))
              //     : ImageDisplayDirectorsAdd(
              //         image: MemoryImage(
              //           const Base64Decoder().convert( Get.find<DirectorsController>().directors[index].image),
              //         ),
              //         pickMedia: InkWell(
              //             child: const Icon(
              //               Icons.face_retouching_natural_rounded,
              //               color: Colors.white,
              //               size: 22,
              //             ),
              //             onTap: () {
              //               Get.find<DirectorsEditController>().pickimage();
              //             }),
              //       )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 7),
                child: const Text(
                  'Personal Details',
                  style: TextStyle(fontSize: 19, fontFamily: 'Montserrat Bold'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Form(
                key: Get.find<DirectorsEditController>().formKey,
                child: DirectorsEditFieldView(
                  date: Get.find<DirectorsController>().directors[index].dob,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: EditDirectorsButton(index: index),
    );
  }

  initValues() {
    final dob =
        DateTime.parse(Get.find<DirectorsController>().directors[index].dob);
    Get.find<DirectorsEditDateController>().initDatePersonal(dob);
    Get.find<DirectorsEditController>().addressController.text =
        Get.find<DirectorsController>().directors[index].address;
    Get.find<DirectorsEditController>().fatherNameController.text =
        Get.find<DirectorsController>().directors[index].fathersname;
    Get.find<DirectorsEditController>().firstNameController.text =
        Get.find<DirectorsController>().directors[index].firstname;
    Get.find<DirectorsEditController>().lastNameController.text =
        Get.find<DirectorsController>().directors[index].lastname!;
    Get.find<DirectorsEditController>().mailIdController.text =
        Get.find<DirectorsController>().directors[index].email;
    Get.find<DirectorsEditController>().midNameController.text =
        Get.find<DirectorsController>().directors[index].middlename!;
    Get.find<DirectorsEditController>().mobNoController.text =
        Get.find<DirectorsController>().directors[index].mobile;
    Get.find<DirectorsEditController>().panNoController.text =
        Get.find<DirectorsController>().directors[index].pannumber;
  }
}
 // : ImageDisplay(
                  //     image: MemoryImage(
                  //       const Base64Decoder()
                  //           .convert(Get.find<DirectorsEditController>().assetImage),
                  //     ),
                  //     pickMedia: InkWell(
                  //         child: const Icon(
                  //           Icons.face_retouching_natural_rounded,
                  //           color: Colors.white,
                  //           size: 22,
                  //         ),
                  //         onTap: () {
                  //           Get.find<DirectorsEditController>().pickimage();
                  //         }),
                  //   ), 
// : (Get.find<DirectorsEditController>().assetImage.isEmpty)
                      //     ?