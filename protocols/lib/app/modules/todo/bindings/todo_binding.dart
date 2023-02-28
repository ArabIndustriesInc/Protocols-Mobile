import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';

class TodoBinding extends Bindings {
  final BuildContext context;

  TodoBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(
      () => TodoController(context),
    );
  }
}
