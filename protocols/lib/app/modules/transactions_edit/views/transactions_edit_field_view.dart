import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/transaction_card_consts.dart';
import 'package:protocols/app/modules/consts/transactions_consts.dart';
import 'package:protocols/app/modules/transactions_edit/controllers/transactions_edit_controller.dart';
import 'package:protocols/app/modules/transactions_edit/controllers/transactions_edit_date_controller.dart';

class TransactionsEditFieldView extends GetView {
  final String date;
  final String time;
  const TransactionsEditFieldView(
      {Key? key, required this.date, required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: Get.find<TransactionsEditController>().formKey,
        child: Wrap(
          runSpacing: 25.h,
          children: [
            TextFormField(
              controller:
                  Get.find<TransactionsEditController>().transNameController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Transaction Name is required!";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.name,
              decoration: TransFieldDeco().transNameDeco,
              cursorColor: Colors.grey[600],
            ),
            GetBuilder<TransactionsEditController>(builder: (_) {
              return TypePickCard(
                icon: Icons.calendar_today,
                subTitle: 'Date',
                title: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: Get.find<TransactionsEditController>()
                        .transTypeValue
                        .value,
                    icon: const Icon(Icons.expand_more_rounded),
                    onChanged: (String? newValue) {
                      Get.find<TransactionsEditController>()
                          .updatePriortiy(newValue);
                    },
                    items: Get.find<TransactionsEditController>()
                        .transType
                        .map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                  ),
                ),
                iconSize: 27,
              );
            }),
            TextFormField(
              controller:
                  Get.find<TransactionsEditController>().amountController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Amount is required!";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.number,
              decoration: TransFieldDeco().amountDeco,
              cursorColor: Colors.grey[600],
            ),
            TimePickCardEditTrans(
              time: time,
              icon: Icons.alarm,
              subTitle: 'Time',
              title: Obx(
                () => Text(
                  Get.find<TransactionsEditDateController>().selectedTime.value,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              iconSize: 30,
            ),
            DatePickCardEditTrans(
              date: date,
              icon: Icons.calendar_today,
              subTitle: 'Date',
              title: Obx(
                () => Text(
                  "${Get.find<TransactionsEditDateController>().todayDate.value} ${Get.find<TransactionsEditDateController>().todayMonth.value} '${Get.find<TransactionsEditDateController>().yrShort.value}",
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              iconSize: 27,
            ),
            TextFormField(
              controller: Get.find<TransactionsEditController>().descController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Description is required!";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.text,
              maxLines: 3,
              decoration: TransFieldDeco().descDeco,
              cursorColor: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
