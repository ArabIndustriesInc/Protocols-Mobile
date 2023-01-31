import 'package:get/get.dart';

import 'package:protocols/app/modules/todo_edit/controllers/todo_edit_date_controller.dart';

import '../controllers/todo_edit_controller.dart';

class TodoEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoEditDateController>(
      () => TodoEditDateController(),
    );
    Get.lazyPut<TodoEditController>(
      () => TodoEditController(),
    );
  }
}
