// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/documents/controllers/documents_controller.dart';
import 'package:protocols/app/modules/documents/views/docs_button_view.dart';
import 'package:protocols/app/modules/documents/views/filecard_view.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocumentsView extends GetView<DocumentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Center(
              child: Text(
                'Documents',
                style: TextStyle(
                    fontSize: 25.sp,
                    letterSpacing: .9,
                    fontFamily: 'Montserrat Black'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Obx(() {
              return (Get.find<DocumentsController>().loading.value)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(child: CircularProgressIndicator()))
                  : GetBuilder<DocumentsController>(
                      init: DocumentsController(),
                      builder: (_) {
                        return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, index) {
                              return (Get.find<DocumentsController>()
                                      .folders
                                      .isEmpty)
                                  ? const EmptyDashMessage(title: 'No Folders!')
                                  : Padding(
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: FileCardView(
                                        index: index,
                                      ),
                                    );
                            },
                            separatorBuilder: (BuildContext context, index) {
                              return Divider(
                                thickness: .5,
                                height: 5.h,
                              );
                            },
                            itemCount: (Get.find<DocumentsController>()
                                    .folders
                                    .isEmpty)
                                ? 1
                                : Get.find<DocumentsController>()
                                    .folders
                                    .length);
                      });
            }),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          right: 10.w,
        ),
        child: const DocsButtonView(),
      ),
    );
  }
}
