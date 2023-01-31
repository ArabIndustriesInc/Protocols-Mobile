import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/transactions_add/controllers/transactions_add_date_controller.dart';

class TransFieldDeco {
  final transNameDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 23.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Transaction Name',
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final descDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 23.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Description',
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));

  final amountDeco = InputDecoration(
      filled: true,
      fillColor: const Color(0xffF5FAFF),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 23.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xffEEF6FF), width: .8),
      ),
      hintText: 'Amount',
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Montserrat SemiBold',
        color: const Color(0xffADADAD),
      ));
}

class TypePickCard extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const TypePickCard(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
        child: Row(
          children: [
            const Icon(
              Icons.import_export_rounded,
              size: 23,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: title,
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       subTitle,
            //       style: const TextStyle(color: Color(0xffADADAD), fontSize: 14),
            //     ),
            //     title,
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class TimePickCard extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const TimePickCard(
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
          Get.find<TransactionsAddDateController>().timePicker(context);
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

class DatePickCard extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const DatePickCard(
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
          Get.find<TransactionsAddDateController>().datePicker(context);
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
