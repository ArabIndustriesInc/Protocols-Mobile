import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';

class FolderBinding extends Bindings {
  final String folderId;
  final BuildContext context;
  FolderBinding({required this.folderId, required this.context});
  @override
  void dependencies() {
    Get.lazyPut<FolderController>(
      () => FolderController(folderId: folderId, context: context),
    );
  }
}
