import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';

class NotesBinding extends Bindings {
  final BuildContext context;

  NotesBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<NotesController>(
      () => NotesController(context),
    );
  }
}
