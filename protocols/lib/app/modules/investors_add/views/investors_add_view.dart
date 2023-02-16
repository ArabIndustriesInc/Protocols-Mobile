import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/investors_consts.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/investors_add/controllers/investors_add_controller.dart';
import 'package:protocols/app/modules/investors_add/views/investors_add_field_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestorsAddView extends GetView<InvestorsAddController> {
  const InvestorsAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                  'Add Investors',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Obx(() => (Get.find<InvestorsAddController>()
                          .imageSample
                          .value
                          .isNotEmpty)
                      ? ImageDisplayInvestorsAdd(
                          image: FileImage(File(
                              Get.find<InvestorsAddController>()
                                  .imageSample
                                  .value)),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<InvestorsAddController>().pickimage();
                              }))
                      :
                      // : (Get.find<InvestorsAddController>().assetImage.isEmpty)
                      //     ?
                      ImageDisplayInvestorsAdd(
                          image:
                              const AssetImage('assets/images/profile_pic.png'),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<InvestorsAddController>().pickimage();
                              }),
                        )
                  // : ImageDisplay(
                  //     image: MemoryImage(
                  //       const Base64Decoder()
                  //           .convert(Get.find<InvestorsAddController>().assetImage),
                  //     ),
                  //     pickMedia: InkWell(
                  //         child: const Icon(
                  //           Icons.face_retouching_natural_rounded,
                  //           color: Colors.white,
                  //           size: 22,
                  //         ),
                  //         onTap: () {
                  //           Get.find<InvestorsAddController>().pickimage();
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
                  'Personal Details',
                  style: TextStyle(fontSize: 19, fontFamily: 'Montserrat Bold'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Form(
                key: Get.find<InvestorsAddController>().formKey,
                child: const InvestorsAddFieldView(),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(() => (Get.find<InvestorsAddController>().isWarning.value)
                  ? Text(
                      Get.find<InvestorsAddController>().warning.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFD40A0A),
                      ),
                    )
                  : const SizedBox())
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AddInvestorsButton(),
    );
  }
}
