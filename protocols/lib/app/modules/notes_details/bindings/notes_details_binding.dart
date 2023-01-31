import 'package:get/get.dart';

import '../controllers/notes_details_controller.dart';

class NotesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesDetailsController>(
      () => NotesDetailsController(),
    );
  }
}
