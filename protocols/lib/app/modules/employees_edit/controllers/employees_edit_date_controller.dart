import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class EmployeesEditDateController extends GetxController {
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
  DateTime pickedDateWork = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  var todayMonthWork = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDateWork = DateFormat.d().format(DateTime.now()).obs;
  var todayYearWork = DateFormat.y().format(DateTime.now());
  var yrShortWork = DateFormat.y().format(DateTime.now()).substring(2, 4).obs;
  var todayMonthPersonal = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDatePersonal = DateFormat.d().format(DateTime.now()).obs;
  var todayYearPersonal = DateFormat.y().format(DateTime.now());
  var yrShortPersonal =
      DateFormat.y().format(DateTime(1988)).substring(2, 4).obs;
  initDateWork(DateTime date) {
    pickedDateWork = date;
    todayDateWork.value = DateFormat.d().format(date);
    todayMonthWork.value = DateFormat.MMM().format(date);
    todayYearWork = DateFormat.y().format(date);
    yrShortWork.value = todayYearWork.substring(2, 4);
    update();
  }

  initDatePersonal(DateTime date) {
    pickedDatePersonal = date;
    todayDatePersonal.value = DateFormat.d().format(date);
    todayMonthPersonal.value = DateFormat.MMM().format(date);
    todayYearPersonal = DateFormat.y().format(date);
    yrShortPersonal.value = todayYearPersonal.substring(2, 4);
    update();
  }

  Future datePickerWork(BuildContext context, DateTime date) async {
    pickedDateWork = (await showDatePicker(
            context: context,
            initialDate: (pickedDateWork != todayDay) ? pickedDateWork : date,
            firstDate: DateTime(1900),
            lastDate: todayDay,
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDateWork;
    if (pickedDateWork == todayDay) {
      pickedDateWork = date;
    }
    todayDateWork.value = DateFormat.d().format(pickedDateWork);
    todayMonthWork.value = DateFormat.MMM().format(pickedDateWork);
    todayYearWork = DateFormat.y().format(pickedDateWork);
    yrShortWork.value = todayYearWork.substring(2, 4);
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
