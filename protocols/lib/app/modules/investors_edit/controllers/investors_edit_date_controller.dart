import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class InvestorsEditDateController extends GetxController {
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
    pickedDatePersonal = date;
    todayDatePersonal.value = DateFormat.d().format(date);
    todayMonthPersonal.value = DateFormat.MMM().format(date);
    todayYearPersonal = DateFormat.y().format(date);
    yrShortPersonal.value = todayYearPersonal.substring(2, 4);
    update();
  }

  Future datePickerPersonal(BuildContext context, DateTime date) async {
    pickedDatePersonal = (await showDatePicker(
            context: context,
            initialDate:
                (pickedDatePersonal != todayDay) ? pickedDatePersonal : date,
            firstDate: DateTime(1900),
            lastDate: todayDay,
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
}
