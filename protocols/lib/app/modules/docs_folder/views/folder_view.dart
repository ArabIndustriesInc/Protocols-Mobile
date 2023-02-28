import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/files_provider.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';
import 'package:protocols/app/modules/docs_folder/functions/folder_functions.dart';
import 'package:protocols/app/modules/docs_folder/views/fold_structure_view.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FolderView extends GetView<FolderController> {
  final String folderName;
  const FolderView({Key? key, required this.folderName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (FilesProvider.isFinishedFolderDownloading == true) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBarCustom().appBar(context),
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
                  height: MediaQuery.of(context).size.height / 23,
                ),
                Center(
                  child: Text(
                    folderName,
                    style: TextStyle(
                        fontSize: 25.sp,
                        letterSpacing: .9,
                        fontFamily: 'Montserrat Black'),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const FoldStructureView()
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
            right: 10.w,
          ),
          child: FolderViewButton(
            folderid: Get.find<FolderController>().folderId,
          ),
        ),
      ),
    );
  }
}
