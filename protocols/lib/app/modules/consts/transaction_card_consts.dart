import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/transactions_edit/controllers/transactions_edit_date_controller.dart';

class TransactionDescriptionView extends GetView {
  final String title;
  final String content;
  const TransactionDescriptionView({
    super.key,
    required this.content,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 25.0, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 4.3,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13.5.sp,
                fontFamily: 'Montserrat Bold',
              ),
            ),
          ),
          Text(
            ':  ',
            style: TextStyle(
              fontSize: 13.5.sp,
            ),
          ),
          Flexible(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 13.5.sp,
                fontFamily: 'Montserrat Medium',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimePickCardEditTrans extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  final String time;
  const TimePickCardEditTrans(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.time,
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
          Get.find<TransactionsEditDateController>().timePicker(context, time);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
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
                  style:
                      const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                ),
                title,
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DatePickCardEditTrans extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  final String date;
  const DatePickCardEditTrans(
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
          final dateOg = DateTime.parse(date);
          Get.find<TransactionsEditDateController>()
              .datePicker(context, dateOg);
        },
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 25, left: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
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
                  style:
                      const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                ),
                title,
              ],
            )
          ],
        ),
      ),
    );
  }
}
