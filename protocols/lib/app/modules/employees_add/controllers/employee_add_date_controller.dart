// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class EmployeeAddDateController extends GetxController {
  final todayDay = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  DateTime pickedDateWork = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  var todayMonthWork = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDateWork = DateFormat.d().format(DateTime.now()).obs;
  var todayYearWork = DateFormat.y().format(DateTime.now());
  var yrShortWork = DateFormat.y().format(DateTime.now()).substring(2, 4).obs;
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
  Future datePickerWork(BuildContext context) async {
    pickedDateWork = (await showDatePicker(
            context: context,
            initialDate:
                (pickedDateWork != todayDay) ? pickedDateWork : todayDay,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDateWork;

    if (pickedDateWork.toString().isEmpty) {
      pickedDateWork = todayDay;
    }
    todayDateWork.value = DateFormat.d().format(pickedDateWork);
    todayMonthWork.value = DateFormat.MMM().format(pickedDateWork);
    todayYearWork = DateFormat.y().format(pickedDateWork);
    yrShortWork.value = todayYearWork.substring(2, 4);
    update();
  }

  Future datePickerPersonal(BuildContext context) async {
    pickedDatePersonal = (await showDatePicker(
            context: context,
            initialDate: (pickedDatePersonal != DateTime.now())
                ? pickedDatePersonal
                : todayDay,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDatePersonal;

    if (pickedDatePersonal.toString().isEmpty) {
      pickedDatePersonal = todayDay;
    }
    todayDatePersonal.value = DateFormat.d().format(pickedDatePersonal);
    todayMonthPersonal.value = DateFormat.MMM().format(pickedDatePersonal);
    todayYearPersonal = DateFormat.y().format(pickedDatePersonal);
    yrShortPersonal.value = todayYearPersonal.substring(2, 4);
    update();
  }
}
