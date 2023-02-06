import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/folder_model.dart';
import 'package:protocols/app/data/providers/folder_provider.dart';
import 'package:protocols/app/modules/custom_alert/views/custom_alert_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/documents/controllers/documents_controller.dart';

class DocsButtonView extends GetView<DocumentsController> {
  const DocsButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomAlert(
                  color: Colors.black,
                  content: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Form(
                        key: Get.find<DocumentsController>().formKey,
                        child: TextFormField(
                          controller:
                              Get.find<DocumentsController>().controller,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "Folder name is required!";
                            } else {
                              return null;
                            }
                          }),
                          decoration: DocumentsController().textfieldDeco,
                        ),
                      )),
                  title: 'Create Folder',
                  action: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      if (!Get.find<DocumentsController>().loadingAdd.value) {
                        if (Get.find<DocumentsController>()
                            .formKey
                            .currentState!
                            .validate()) {
                          Get.find<DocumentsController>().loadingAdd.value =
                              true;
                          final folder = AddFolders(
                              foldername: Get.find<DocumentsController>()
                                  .controller
                                  .text
                                  .trim());
                          FolderProvider().addFolder(folder, context);
                        }
                      }
                    },
                    child: Obx(() {
                      return (Get.find<DocumentsController>().loadingAdd.value)
                          ? Transform.scale(
                              scale: 0.6,
                              child: const CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 1.7,
                              ),
                            )
                          : const Text(
                              "Create",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            );
                    }),
                  ),
                  isWarning: true,
                  warning: Obx(() =>
                      (Get.find<DocumentsController>().errorIsVisible.value)
                          ? Text(
                              Get.find<DocumentsController>().errorMesage.value,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFD40A0A),
                              ),
                            )
                          : const SizedBox()),
                );
              });
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 35.w,
        ),
      ),
    );
  }
}
