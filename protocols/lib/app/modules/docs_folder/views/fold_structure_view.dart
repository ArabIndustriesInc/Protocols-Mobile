// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';
import 'package:protocols/app/modules/docs_folder/views/folder_filecard_view.dart';

class FoldStructureView extends GetView<FolderController> {
  const FoldStructureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Obx(
          () {
            return (Get.find<FolderController>().loading.value)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(child: CircularProgressIndicator()))
                : (Get.find<FolderController>().files.isEmpty)
                    ? const EmptyDashMessage(title: 'Folder Empty!')
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Get.find<FolderController>().files.length,
                        itemBuilder: (context, index) {
                          final icon = Get.find<FolderController>().iconPick(
                              p.extension(Get.find<FolderController>()
                                  .files[index]
                                  .filename));
                          final name = Get.find<FolderController>()
                              .files[index]
                              .filename;
                          final image =
                              Get.find<FolderController>().files[index].image;
                          return FolderFilecardView(
                            name: name,
                            image: image,
                            index: index,
                            icon: icon,
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
        ));
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