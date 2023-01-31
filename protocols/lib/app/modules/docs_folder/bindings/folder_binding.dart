import 'package:get/get.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';

class FolderBinding extends Bindings {
  final String folderId;
  FolderBinding({required this.folderId});
  @override
  void dependencies() {
    Get.lazyPut<FolderController>(
      () => FolderController(folderId: folderId),
    );
  }
}
