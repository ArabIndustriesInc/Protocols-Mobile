import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/directors_const.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_controller.dart';
import 'package:protocols/app/modules/directors_add/views/directors_add_field_view.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectorsAddView extends GetView<DirectorsAddController> {
  final String title;
  final String action;
  const DirectorsAddView({Key? key, required this.title, required this.action})
      : super(key: key);
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
                  title,
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Obx(() => (Get.find<DirectorsAddController>()
                          .imageSample
                          .value
                          .isNotEmpty)
                      ? ImageDisplayDirectorsAdd(
                          image: FileImage(File(
                              Get.find<DirectorsAddController>()
                                  .imageSample
                                  .value)),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<DirectorsAddController>().pickimage();
                              }))
                      :
                      // : (Get.find<DirectorsAddController>().assetImage.isEmpty)
                      //     ?
                      ImageDisplayDirectorsAdd(
                          image:
                              const AssetImage('assets/images/profile_pic.png'),
                          pickMedia: InkWell(
                              child: const Icon(
                                Icons.face_retouching_natural_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              onTap: () {
                                Get.find<DirectorsAddController>().pickimage();
                              }),
                        )
                  // : ImageDisplay(
                  //     image: MemoryImage(
                  //       const Base64Decoder()
                  //           .convert(Get.find<DirectorsAddController>().assetImage),
                  //     ),
                  //     pickMedia: InkWell(
                  //         child: const Icon(
                  //           Icons.face_retouching_natural_rounded,
                  //           color: Colors.white,
                  //           size: 22,
                  //         ),
                  //         onTap: () {
                  //           Get.find<DirectorsAddController>().pickimage();
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
                key: Get.find<DirectorsAddController>().formKey,
                child: const DirectorsAddFieldView(),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddDirectorsButton(action: action),
    );
  }
}
