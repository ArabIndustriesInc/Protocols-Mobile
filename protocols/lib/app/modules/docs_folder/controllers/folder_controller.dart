// import 'package:file_picker/file_picker.dart';
// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:protocols/app/data/providers/files_provider.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/docs_folder/functions/folder_functions.dart';

class FolderController extends GetxController {
  final String folderId;
  final BuildContext context;
  var loading = true.obs;
  var loadingDelete = false.obs;
  var loadingAdd = false.obs;
  Directory? appStorage;
  FolderController({required this.folderId, required this.context});
  RxList files = [].obs;
  var fileIndex = '-1'.obs;
  var percentage = 0.0.obs;
  Widget progressBar(int index) {
    final indexFile = int.parse(fileIndex.value);
    return (index != indexFile)
        ? const SizedBox()
        :
        // Text(
        //     '${percentage.value.toStringAsFixed(0)}%',
        //     style: TextStyle(fontSize: 10.sp),
        //   );

        CircularPercentIndicator(
            radius: 16.w,
            lineWidth: 3.w,
            circularStrokeCap: CircularStrokeCap.round,
            curve: Curves.elasticIn,
            percent: percentage.value / 100,
            center: Text(
              '${percentage.value.toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 8.sp),
            ),
            backgroundColor: Colors.transparent,
            progressColor: Colors.blue[500],
          );
  }

  Future<String> getStorage() async {
    appStorage = await getTemporaryDirectory();
    return appStorage!.path;
  }

  Future<bool> onWillPop() async {
    if (FilesProvider.isFinishedFolderDownloading == true) {
      return false;
    } else {
      Get.back();
      return true;
    }
  }

  openFile(
      String fileName, String image, BuildContext context, int index) async {
    final file = await FilesProvider().downloadFile(fileName, image, index);
    if (file == File('null')) {
      SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong, try again later', context);
    } else {
      OpenFilex.open(file.path);
    }
  }

  String calculateSize(int size) {
    final kb = size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return fileSize;
  }

  String iconPick(String ext) {
    return FolderFunctions().extentionFinder(ext);
  }

  getAllFiles() async {
    await FilesProvider().getAllFiles(folderId, context);
    update();
  }

  // @override
  // void onClose() {
  //   final dir = Directory(appStorage!.path);
  //   dir.deleteSync(recursive: true);
  //   super.onClose();
  // }

  @override
  void onInit() {
    getAllFiles();
    update();
    super.onInit();
  }
}
