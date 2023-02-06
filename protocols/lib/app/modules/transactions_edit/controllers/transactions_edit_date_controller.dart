// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class TransactionsEditDateController extends GetxController {
  TimeOfDay pickedTime = TimeOfDay.now();
  TimeOfDay todayTime = TimeOfDay.now();
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
  initTime(String timeDate, BuildContext context) {
    DateTime dateTime =
        DateTime.parse('${todayDay.toString().substring(0, 10)} $timeDate');
    final time = DateFormat.jm().format(dateTime);
    selectedTime.value = time;
    update();
  }

  Future timePicker(BuildContext context, String timeDate) async {
    final dt =
        DateTime.parse('${todayDay.toString().substring(0, 10)} $timeDate');
    final time = TimeOfDay.fromDateTime(dt);
    pickedTime = (await showTimePicker(
            context: context,
            initialTime: (pickedTime != todayTime) ? pickedTime : time,
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedTime;
    if (pickedTime == todayTime) {
      pickedTime = time;
    }
    selectedTime.value = pickedTime.format(context);

    update();
  }

  initDate(String dateTime, BuildContext context) {
    final date = DateTime.parse(dateTime);
    todayDate.value = DateFormat.d().format(date);
    todayMonth.value = DateFormat.MMM().format(date);
    todayYear = DateFormat.y().format(date);
    yrShort.value = todayYear.substring(2, 4);

    update();
  }

  Future datePicker(BuildContext context, DateTime date) async {
    pickedDate = (await showDatePicker(
            context: context,
            initialDate: (pickedDate != todayDay) ? pickedDate : date,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDate;
    if (pickedDate == todayDay) {
      pickedDate = date;
    }
    todayDate.value = DateFormat.d().format(pickedDate);
    todayMonth.value = DateFormat.MMM().format(pickedDate);
    todayYear = DateFormat.y().format(pickedDate);
    yrShort.value = todayYear.substring(2, 4);
    update();
  }
}
