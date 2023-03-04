import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/modules/consts/employees_edit_work_details_consts.dart';

class TodoAddDateController extends GetxController {
  final todayDay = DateTime.now();
  DateTime pickedDateToDo = DateTime.now();
  var todayMonthToDo = DateFormat.MMM().format(DateTime.now()).obs;
  var todayDateToDo = DateFormat.d().format(DateTime.now()).obs;
  var todayYearToDo = DateFormat.y().format(DateTime.now());
  var yrShortToDo = DateFormat.y().format(DateTime.now()).substring(2, 4).obs;

  Future datePickerToDo(BuildContext context) async {
    pickedDateToDo = (await showDatePicker(
            context: context,
            initialDate:
                (pickedDateToDo != todayDay) ? pickedDateToDo : todayDay,
            firstDate: todayDay,
            lastDate: DateTime(2080),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        pickedDateToDo;
    todayDateToDo.value = DateFormat.d().format(pickedDateToDo);
    todayMonthToDo.value = DateFormat.MMM().format(pickedDateToDo);
    todayYearToDo = DateFormat.y().format(pickedDateToDo);
    yrShortToDo.value = todayYearToDo.substring(2, 4);
    update();
  }
}

class ToDoDueDatePickCardAdd extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const ToDoDueDatePickCardAdd(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Get.find<TodoAddDateController>().datePickerToDo(context);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: iconSize,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                      color: const Color(0xffADADAD), fontSize: 14.sp),
                ),
                title,
              ],
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.expand_more_rounded,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
