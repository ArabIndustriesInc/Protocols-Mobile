import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/consts/transactions_consts.dart';
import 'package:protocols/app/modules/transactions_add/controllers/transactions_add_controller.dart';
import 'package:protocols/app/modules/transactions_add/controllers/transactions_add_date_controller.dart';

class TransactionsAddFieldView extends GetView<TransactionsAddDateController>
    with InputValidationMixin {
  const TransactionsAddFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: Get.find<TransactionsAddController>().formKey,
        child: Wrap(
          runSpacing: 25.h,
          children: [
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller:
                  Get.find<TransactionsAddController>().transNameController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Transaction Name is required!";
                } else if (!isNameValid(value)) {
                  return "Invalid input, Enter valid one!";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.name,
              decoration: TransFieldDeco().transNameDeco,
              cursorColor: Colors.grey[600],
            ),
            GetBuilder<TransactionsAddController>(builder: (_) {
              return TypePickCard(
                icon: Icons.calendar_today,
                subTitle: 'Date',
                title: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: Get.find<TransactionsAddController>()
                        .transTypeValue
                        .value,
                    icon: const Icon(Icons.expand_more_rounded),
                    onChanged: (String? newValue) {
                      Get.find<TransactionsAddController>()
                          .updatePriortiy(newValue);
                    },
                    items: Get.find<TransactionsAddController>()
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
                  Get.find<TransactionsAddController>().amountController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Amount is required!";
                } else if (!isAmountValid(value)) {
                  return "Invalid input, Enter valid one!";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.number,
              decoration: TransFieldDeco().amountDeco,
              cursorColor: Colors.grey[600],
            ),
            TimePickCard(
              icon: Icons.alarm,
              subTitle: 'Time',
              title: Obx(
                () => Text(
                  Get.find<TransactionsAddDateController>().selectedTime.value,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              iconSize: 30,
            ),
            DatePickCard(
              icon: Icons.calendar_today,
              subTitle: 'Date',
              title: Obx(
                () => Text(
                  "${Get.find<TransactionsAddDateController>().todayDate.value} ${Get.find<TransactionsAddDateController>().todayMonth.value} '${Get.find<TransactionsAddDateController>().yrShort.value}",
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              iconSize: 27,
            ),
            TextFormField(
              controller: Get.find<TransactionsAddController>().descController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Description is required!";
                }
                // else if (!isAddressValid(value)) {
                //   return "Invalid input, Enter valid one!";
                // }
                else {
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
