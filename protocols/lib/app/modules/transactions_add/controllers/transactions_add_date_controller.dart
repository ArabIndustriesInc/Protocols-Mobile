// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class TransactionsAddDateController extends GetxController {
  TimeOfDay pickedTime = TimeOfDay.now();
  RxString selectedTime = DateFormat.jm().format(DateTime.now()).toString().obs;
  final todayDay = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  DateTime pickedDate = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  var todayMonth = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDate = DateFormat.d().format(DateTime.now()).obs;
  var todayYear = DateFormat.y().format(DateTime.now());
  var yrShort = DateFormat.y().format(DateTime.now()).substring(2, 4).obs;
  Future timePicker(BuildContext context) async {
    pickedTime = (await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        TimeOfDay.now();
    selectedTime.value = pickedTime.format(context);
    update();
  }

  Future datePicker(BuildContext context) async {
    pickedDate = (await showDatePicker(
            context: context,
            initialDate: (pickedDate != todayDay) ? pickedDate : todayDay,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDate;
    todayDate.value = DateFormat.d().format(pickedDate);
    todayMonth.value = DateFormat.MMM().format(pickedDate);
    todayYear = DateFormat.y().format(pickedDate);
    yrShort.value = todayYear.substring(2, 4);

    update();
  }
}
