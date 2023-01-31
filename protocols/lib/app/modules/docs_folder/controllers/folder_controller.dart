// import 'package:file_picker/file_picker.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:protocols/app/data/models/files_model.dart';
import 'package:protocols/app/data/providers/files_provider.dart';
import 'package:protocols/app/modules/docs_folder/functions/folder_functions.dart';

class FolderController extends GetxController {
  final String folderId;
  var loading = true.obs;
  FolderController({required this.folderId});
  List<Files> files = [];
  List<PlatformFile> documents = [];
  add(PlatformFile file) {
    documents.add(file);
    update();
  }

  openFile(PlatformFile file) {
    OpenFilex.open(file.path!);
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
    files = await FilesProvider().getAllFolders();
    update();
  }

  @override
  void onInit() {
    getAllFiles();
    update();
    super.onInit();
  }
}
