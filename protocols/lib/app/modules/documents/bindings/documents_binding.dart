import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/documents/controllers/documents_controller.dart';

class DocumentsBinding extends Bindings {
  final BuildContext context;

  DocumentsBinding(this.context);
  @override
  void dependencies() {
    Get.lazyPut<DocumentsController>(
      () => DocumentsController(context),
    );
  }
}
