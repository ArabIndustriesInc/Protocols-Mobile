// import 'package:file_picker/file_picker.dart';
// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:protocols/app/data/providers/files_provider.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/docs_folder/functions/folder_functions.dart';

class FolderController extends GetxController {
  final String folderId;
  var loading = true.obs;
  var loadingDelete = false.obs;
  var loadingAdd = false.obs;
  late Directory appStorage;
  FolderController({required this.folderId});
  RxList files = [].obs;

  Future<String> getStorage() async {
    appStorage = await getApplicationDocumentsDirectory();
    return appStorage.path;
  }

  openFile(String fileName, String image, BuildContext context) async {
    final file = await FilesProvider().downloadFile(fileName, image);
    if (file == File('null')) {
      SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong! try again later', context);
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
    files.value = await FilesProvider().getAllFiles(folderId);
    update();
  }

  @override
  void onInit() {
    getAllFiles();
    update();
    super.onInit();
  }
}
