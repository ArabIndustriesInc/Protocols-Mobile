import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/folder_provider.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/documents/controllers/documents_controller.dart';

class FileCardView extends GetView<DocumentsController> {
  final int index;
  const FileCardView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListTile(
        onTap: () {
          // final folderId = Get.find<DocumentsController>().folders[index].id;
          // Get.to(
          //   () => FolderView(
          //       folderName:
          //           Get.find<DocumentsController>().folders[index].foldername),
          //   binding: FolderBinding(folderId: folderId),
          // );
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return DeleteAlertView(
                  subtitle:
                      'Are you sure, you want to delete this Folder? This action can\'t be reversed!',
                  title: 'Delete Folder',
                  action: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      if (!Get.find<DocumentsController>()
                          .loadingDelete
                          .value) {
                        Get.find<DocumentsController>().loadingDelete.value =
                            true;
                        final id =
                            Get.find<DocumentsController>().folders[index].id;
                        FolderProvider().deleteFoldersModel(id, context);
                      }
                    },
                    child: Obx(() {
                      return (Get.find<DocumentsController>()
                              .loadingDelete
                              .value)
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
        leading: SvgPicture.asset(
          'assets/icons/file.svg',
          width: 40.w,
        ),
        title: Text(
          Get.find<DocumentsController>().folders[index].foldername,
          style: TextStyle(
            fontSize: 17.sp,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Colors.black,
          size: 17.w,
        ),
      ),
    );
  }
}
// subtitle: Text(
        //   '20 items',
        //   style: TextStyle(
        //     fontSize: 12.sp,
        //     fontFamily: 'Montserrat Medium',
        //   ),
        // ),