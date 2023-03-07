import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';

class SettingsDateController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController midNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController mailIdController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxString image = ''.obs;
  var loadingEdit = false.obs;
  RxString imageSample = ''.obs;
  XFile? pickedImage;
  String? img;
  String? deleteFile;
  var initTimes = 0.obs;
  pickimage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    } else {
      imageSample.value = pickedImage!.path;
      final imgBytes = File(pickedImage!.path).readAsBytesSync();
      img = base64Encode(imgBytes);
      update();
    }
  }

  final todayDay = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  DateTime pickedDatePersonal = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  var todayMonthPersonal = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDatePersonal = DateFormat.d().format(DateTime.now()).obs;
  var todayYearPersonal = DateFormat.y().format(DateTime.now());
  var yrShortPersonal =
      DateFormat.y().format(DateTime.now()).substring(2, 4).obs;

  initDatePersonal(DateTime date) {
    todayDatePersonal.value = DateFormat.d().format(date);
    todayMonthPersonal.value = DateFormat.MMM().format(date);
    todayYearPersonal = DateFormat.y().format(date);
    yrShortPersonal.value = todayYearPersonal.substring(2, 4);
    update();
    pickedDatePersonal = date;
  }

  Future datePickerPersonal(BuildContext context, DateTime date) async {
    pickedDatePersonal = (await showDatePicker(
            context: context,
            initialDate:
                (pickedDatePersonal != todayDay) ? pickedDatePersonal : date,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDatePersonal;

    if (pickedDatePersonal == todayDay) {
      pickedDatePersonal = date;
    }
    todayDatePersonal.value = DateFormat.d().format(pickedDatePersonal);
    todayMonthPersonal.value = DateFormat.MMM().format(pickedDatePersonal);
    todayYearPersonal = DateFormat.y().format(pickedDatePersonal);
    yrShortPersonal.value = todayYearPersonal.substring(2, 4);
    update();
  }

  @override
  void onInit() {
    if (Get.find<SettingsController>().profile.value.firstname != '') {
      firstNameController.text =
          Get.find<SettingsController>().profile.value.firstname;
      midNameController.text =
          Get.find<SettingsController>().profile.value.middlename;
      lastNameController.text =
          Get.find<SettingsController>().profile.value.lastname;
      mobNoController.text =
          Get.find<SettingsController>().profile.value.mobile;
      fatherNameController.text =
          Get.find<SettingsController>().profile.value.fathersname;
      mailIdController.text =
          Get.find<SettingsController>().profile.value.email;
      panNoController.text =
          Get.find<SettingsController>().profile.value.pannumber;
      addressController.text =
          Get.find<SettingsController>().profile.value.address;
      final date =
          DateTime.parse(Get.find<SettingsController>().profile.value.dob);
      initDatePersonal(date);
    }
    super.onInit();
  }
}
