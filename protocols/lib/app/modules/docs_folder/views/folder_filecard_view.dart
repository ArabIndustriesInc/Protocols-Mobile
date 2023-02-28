import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/files_provider.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';

class FolderFilecardView extends GetView<FolderController> {
  final String name;
  final String image;
  final int index;
  final String icon;
  const FolderFilecardView({
    Key? key,
    required this.name,
    required this.image,
    required this.index,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
      child: ListTile(
        onTap: () {
          Get.find<FolderController>().openFile(name, image, context, index);
        },
        trailing: Obx(() {
          return Get.find<FolderController>().progressBar(index);
        }),
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return DeleteAlertView(
                  subtitle:
                      'Are you sure, you want to delete this File? This action can\'t be reversed!',
                  title: 'Delete File',
                  action: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      if (!Get.find<FolderController>().loadingDelete.value) {
                        final fileid =
                            Get.find<FolderController>().files[index].id;
                        final id =
                            Get.find<FolderController>().files[index].folderid;
                        FilesProvider().deleteFile(fileid, id, context);
                      }
                    },
                    child: Obx(() {
                      return (Get.find<FolderController>().loadingDelete.value)
                          ? Transform.scale(
                              scale: 0.6,
                              child: const CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 1.7,
                              ),
                            )
                          : const Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xffE30000),
                                fontWeight: FontWeight.normal,
                              ),
                            );
                    }),
                  ),
                );
              });
        },
        leading: (icon == 'assets/icons/zip.png' ||
                icon == 'assets/icons/unknown.png')
            ? Image.asset(
                icon,
                height: 35.h,
              )
            : SvgPicture.asset(
                icon,
                height: 30.h,
              ),
        title: Text(
          name,
          style: TextStyle(fontSize: 15.sp),
        ),
        // subtitle: Text(
        //   size,
        //   style: TextStyle(
        //       fontSize: 12.sp, fontFamily: 'Montserrat Medium'),
        // ),
      ),
    );
  }
}
