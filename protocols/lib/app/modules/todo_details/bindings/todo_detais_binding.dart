import 'package:get/get.dart';

import '../controllers/todo_detais_controller.dart';

class TodoDetaisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoDetaisController>(
      () => TodoDetaisController(),
    );
  }
}
