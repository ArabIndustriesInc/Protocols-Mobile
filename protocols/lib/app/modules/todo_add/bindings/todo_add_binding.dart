import 'package:get/get.dart';

import 'package:protocols/app/modules/todo_add/controllers/todo_add_date_controller.dart';

import '../controllers/todo_add_controller.dart';

class TodoAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoAddDateController>(
      () => TodoAddDateController(),
    );
    Get.lazyPut<TodoAddController>(
      () => TodoAddController(),
    );
  }
}
