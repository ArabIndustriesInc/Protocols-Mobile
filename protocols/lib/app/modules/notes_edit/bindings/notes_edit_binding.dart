import 'package:get/get.dart';

import '../controllers/notes_edit_controller.dart';

class NotesEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesEditController>(
      () => NotesEditController(),
    );
  }
}
