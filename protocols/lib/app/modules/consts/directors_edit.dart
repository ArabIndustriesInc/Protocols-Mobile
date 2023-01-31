import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_date_controller.dart';

class DatePickDirectorsEdit extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  final String date;
  const DatePickDirectorsEdit(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.date,
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
          final dateTime = DateTime.parse(date);
          Get.find<DirectorsEditDateController>()
              .datePickerPersonal(context, dateTime);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
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
                    style:
                        const TextStyle(color: Color(0xffADADAD), fontSize: 14),
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
    );
  }
}
