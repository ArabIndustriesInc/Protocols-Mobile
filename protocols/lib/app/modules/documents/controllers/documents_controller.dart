import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/folder_model.dart';
import 'package:protocols/app/data/providers/folder_provider.dart';

class DocumentsController extends GetxController {
  final BuildContext context;
  List<Folders> folders = [];
  var loading = true.obs;
  var loadingAdd = false.obs;
  var loadingDelete = false.obs;
  RxBool errorIsVisible = false.obs;
  RxString errorMesage = 'Oops wrong Email or Password! Try again'.obs;

  DocumentsController(this.context);

  getAllFolders() async {
    await FolderProvider().getAllFolders(context);
    update();
  }

  visibleOff(String message) {
    errorMesage.value = message;
    errorIsVisible.value = true;
    update();
  }

  @override
  void onClose() {
    controller.clear();
    errorIsVisible.value = false;
    super.onClose();
  }

  @override
  void onInit() async {
    getAllFolders();
    update();
    super.onInit();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  final textfieldDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffEEF6FF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: const EdgeInsets.all(19),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Folder Name',
      hintStyle: const TextStyle(
        fontSize: 15,
        fontFamily: 'Montserrat SemiBold',
        color: Color(0xffADADAD),
      ));
}
