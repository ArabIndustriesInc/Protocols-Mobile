import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class TodoEditDateController extends GetxController {
  final todayDay = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  DateTime pickedDateToDo = DateTime(
    int.parse(DateTime.now().toString().substring(0, 4)),
    int.parse(DateTime.now().toString().substring(5, 7)),
    int.parse(DateTime.now().toString().substring(8, 10)),
  );
  var todayMonthToDo = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDateToDo = DateFormat.d().format(DateTime.now()).obs;
  var todayYearToDo = DateFormat.y().format(DateTime.now());
  var yrShortToDo = DateFormat.y().format(DateTime.now()).substring(2, 4).obs;
  initDateToDo(DateTime date) {
    todayDateToDo.value = DateFormat.d().format(date);
    todayMonthToDo.value = DateFormat.MMM().format(date);
    todayYearToDo = DateFormat.y().format(date);
    yrShortToDo.value = todayYearToDo.substring(2, 4);
    update();
  }

  Future datePickerToDo(BuildContext context, DateTime date) async {
    pickedDateToDo = (await showDatePicker(
            context: context,
            initialDate: (pickedDateToDo != todayDay) ? pickedDateToDo : date,
            firstDate: todayDay,
            lastDate: DateTime(2080),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDateToDo;
    if (pickedDateToDo == todayDay) {
      pickedDateToDo = date;
    }
    todayDateToDo.value = DateFormat.d().format(pickedDateToDo);
    todayMonthToDo.value = DateFormat.MMM().format(pickedDateToDo);
    todayYearToDo = DateFormat.y().format(pickedDateToDo);
    yrShortToDo.value = todayYearToDo.substring(2, 4);
    date = pickedDateToDo;
    update();
  }
}

class ToDoDueDatePickCardEdit extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  final String date;
  const ToDoDueDatePickCardEdit(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.date,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 4,
              color: const Color(0xffABC2D4).withOpacity(.8),
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {
            final dateTime = DateTime.parse(date);
            Get.find<TodoEditDateController>()
                .datePickerToDo(context, dateTime);
          },
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, right: 25, left: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: iconSize,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subTitle,
                      style: const TextStyle(
                          color: Color(0xffADADAD), fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    title,
                  ],
                ),
              ),
              const Icon(
                Icons.expand_more_rounded,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
