import 'package:get/get.dart';

import '../controllers/notes_add_controller.dart';

class NotesAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesAddController>(
      () => NotesAddController(),
    );
  }
}
