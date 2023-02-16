import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/investors_consts.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:protocols/app/modules/investors_edit/controllers/investors_edit_controller.dart';
import 'package:protocols/app/modules/investors_edit/controllers/investors_edit_date_controller.dart';
import 'package:protocols/app/modules/investors_edit/views/investors_edit_field_view.dart';

class InvestorsEditView extends GetView<InvestorsEditController> {
  final int index;
  const InvestorsEditView({Key? key, required this.index}) : super(key: key);
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
                  'Edit investors',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Obx(() => (Get.find<InvestorsEditController>()
                          .imageSample
                          .value
                          .isNotEmpty)
                      ? ImageDisplayInvestorsAdd(
                          image: FileImage(File(
                              Get.find<InvestorsEditController>()
                                  .imageSample
                                  .value)),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<InvestorsEditController>().pickimage();
                              }))
                      :
                      // : (Get.find<InvestorsEditController>().assetImage.isEmpty)
                      //     ?
                      ImageDisplayInvestorsAdd(
                          image: NetworkImage(Get.find<InvestorsController>()
                              .investors[index]
                              .image),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<InvestorsEditController>().pickimage();
                              }),
                        )
                  // : ImageDisplay(
                  //     image: MemoryImage(
                  //       const Base64Decoder()
                  //           .convert(Get.find<InvestorsEditController>().assetImage),
                  //     ),
                  //     pickMedia: InkWell(
                  //         child: const Icon(
                  //           Icons.face_retouching_natural_rounded,
                  //           color: Colors.white,
                  //           size: 22,
                  //         ),
                  //         onTap: () {
                  //           Get.find<InvestorsEditController>().pickimage();
                  //         }),
                  //   ),
                  ),
              // Obx(() => (Get.find<InvestorsEditController>()
              //         .imageSample
              //         .value
              //         .isNotEmpty)
              //     ? ImageDisplayDirectorsEdit(
              //         image: FileImage(File(Get.find<InvestorsEditController>()
              //             .imageSample
              //             .value)),
              //         pickMedia: InkWell(
              //             child: const Icon(
              //               Icons.face_retouching_natural_rounded,
              //               color: Colors.white,
              //               size: 22,
              //             ),
              //             onTap: () {
              //               Get.find<InvestorsEditController>().pickimage();
              //             }))
              //     : ImageDisplayDirectorsEdit(
              //         image: MemoryImage(
              //           const Base64Decoder().convert(Get.find<InvestorsController>().investors[index].image),
              //         ),
              //         pickMedia: InkWell(
              //             child: const Icon(
              //               Icons.face_retouching_natural_rounded,
              //               color: Colors.white,
              //               size: 22,
              //             ),
              //             onTap: () {
              //               Get.find<InvestorsEditController>().pickimage();
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
                key: Get.find<InvestorsEditController>().formKey,
                child: InvestorsEditFieldView(
                  date: Get.find<InvestorsController>().investors[index].dob,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InvestorsEditButton(
        index: index,
      ),
    );
  }

  initValues() {
    final dob =
        DateTime.parse(Get.find<InvestorsController>().investors[index].dob);
    Get.find<InvestorsEditDateController>().initDatePersonal(dob);
    Get.find<InvestorsEditController>().addressController.text =
        Get.find<InvestorsController>().investors[index].address;
    Get.find<InvestorsEditController>().fatherNameController.text =
        Get.find<InvestorsController>().investors[index].fathersname;
    Get.find<InvestorsEditController>().firstNameController.text =
        Get.find<InvestorsController>().investors[index].firstname;
    Get.find<InvestorsEditController>().lastNameController.text =
        Get.find<InvestorsController>().investors[index].lastname!;
    Get.find<InvestorsEditController>().mailIdController.text =
        Get.find<InvestorsController>().investors[index].email;
    Get.find<InvestorsEditController>().midNameController.text =
        Get.find<InvestorsController>().investors[index].middlename!;
    Get.find<InvestorsEditController>().mobNoController.text =
        Get.find<InvestorsController>().investors[index].mobile;
    Get.find<InvestorsEditController>().panNoController.text =
        Get.find<InvestorsController>().investors[index].pannumber;
  }
}
