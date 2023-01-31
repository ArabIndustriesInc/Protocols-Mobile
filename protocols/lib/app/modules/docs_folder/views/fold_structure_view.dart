// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';

class FoldStructureView extends GetView<FolderController> {
  const FoldStructureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Obx(() {
        return (Get.find<FolderController>().loading.value)
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: const Center(child: CircularProgressIndicator()))
            : GetBuilder<FolderController>(
                builder: (_) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Get.find<FolderController>().files.length,
                    itemBuilder: (context, index) {
                      final icon = Get.find<FolderController>().iconPick(
                          p.extension(
                              Get.find<FolderController>().files[index].image));
                      // final file = Get.find<FolderController>().files[index];
                      final name =
                          Get.find<FolderController>().files[index].image;

                      return (Get.find<FolderController>().files.isEmpty)
                          ? const EmptyDashMessage(title: 'Folder Empty!')
                          : Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: ListTile(
                                onTap: () {
                                  // Get.find<FolderController>().openFile(file);
                                },
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
                                              Get.back();
                                              SnackbarMessage().snackBarMessage(
                                                  'File deleted successfully!',
                                                  context);
                                            },
                                            child: const Text(
                                              "Confirm",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Color(0xffE30000),
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                leading: (icon == 'assets/icons/zip.png' ||
                                        icon == 'assets/icons/unknown.png')
                                    ? Image.asset(
                                        icon,
                                        height: 45.h,
                                      )
                                    : SvgPicture.asset(
                                        icon,
                                        height: 33.h,
                                      ),
                                title: Text(
                                  name,
                                  style: TextStyle(fontSize: 15.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // subtitle: Text(
                                //   size,
                                //   style: TextStyle(
                                //       fontSize: 12.sp, fontFamily: 'Montserrat Medium'),
                                // ),
                              ),
                            );
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          color: Colors.black26,
                          height: 10,
                        ),
                      );
                    },
                  );
                },
              );
      }),
    );
  }
}


 // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //   child: GridView.builder(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemCount: 7,
    //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //         maxCrossAxisExtent: 200,
    //         mainAxisExtent: 200,
    //         crossAxisSpacing: 10,
    //         mainAxisSpacing: 10),
    //     itemBuilder: (context, index) {
    //       return Container(
    //         padding: const EdgeInsets.only(top: 5),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.white,
    //           border: Border.all(color: Colors.grey, width: 2),
    //         ),
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               height: MediaQuery.of(context).size.height / 5.8,
    //               child: Image.asset(
    //                 'assets/images/image.jpeg',
    //                 fit: BoxFit.fill,
    //               ),
    //             ),
    //             const Divider(
    //               thickness: 2.5,
    //               color: Colors.grey,
    //             ),
    //             Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 8.0),
    //                   child: Image.asset(
    //                     'assets/icons/files.png',
    //                     height: 30,
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: [
    //                     Flexible(
    //                       child: Text(
    //                         'Image Name',
    //                         style: TextStyle(
    //                             fontFamily: 'Montserrat SemiBold',
    //                             overflow: TextOverflow.ellipsis,
    //                             fontSize:
    //                                 MediaQuery.of(context).size.width / 30),
    //                       ),
    //                     ),
    //                     Flexible(
    //                       child: Text(
    //                         '28.37 MB',
    //                         style: TextStyle(
    //                             overflow: TextOverflow.ellipsis,
    //                             fontSize:
    //                                 MediaQuery.of(context).size.width / 35),
    //                       ),
    //                     )
    //                   ],
    //                 )
    //               ],
    //             )
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );