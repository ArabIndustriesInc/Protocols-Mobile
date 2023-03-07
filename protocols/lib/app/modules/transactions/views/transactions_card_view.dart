import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:protocols/app/data/providers/transaction_provider.dart';
import 'package:protocols/app/modules/consts/transaction_card_consts.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:protocols/app/modules/transactions_edit/bindings/transactions_edit_binding.dart';
import 'package:protocols/app/modules/transactions_edit/views/transactions_edit_view.dart';

class TransactionsCardView extends GetView {
  final int index;
  const TransactionsCardView({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedTextColor: Colors.black,
        textColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 0),
          child: Text(
            Get.find<TransactionsController>().transactions[index].title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ),
        subtitle:
            (Get.find<TransactionsController>().transactions[index].type == '-')
                ? Text(
                    '-\$'
                    '${Get.find<TransactionsController>().transactions[index].amount}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: const Color(0xffFF7474),
                    ),
                  )
                : Text(
                    '-\$'
                    '${Get.find<TransactionsController>().transactions[index].amount}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: const Color(0xff63B263),
                    ),
                  ),
        trailing: PopupMenuButton(
          splashRadius: 20,
          padding: EdgeInsets.zero,
          //color: Colors.yellow,
          icon: const Icon(
            Icons.more_vert_rounded,
            color: Colors.black,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          itemBuilder: (context) {
            return Get.find<TransactionsController>()
                .menuItems
                .map((e) => PopupMenuItem<String>(value: e, child: Text(e)))
                .toList();
          },
          onSelected: (value) {
            switch (value) {
              case 'Edit':
                {
                  Get.to(
                      () => TransactionsEditView(
                            index: index,
                          ),
                      binding: TransactionsEditBinding());
                }
                break;
              case 'Delete':
                {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Obx(() {
                          return DeleteAlertView(
                            subtitle:
                                'Are you sure, you want to delete this transaction? This action can\'t be reversed!',
                            title: 'Delete Transaction',
                            action: InkWell(
                              highlightColor: Colors.grey[200],
                              onTap: () {
                                if (!Get.find<TransactionsController>()
                                    .loadingDelete
                                    .value) {
                                  final id = Get.find<TransactionsController>()
                                      .transactions[index]
                                      .id;
                                  TransactionsProvider()
                                      .deleteTransactionsModel(id, context);
                                }
                              },
                              child: (!Get.find<TransactionsController>()
                                      .loadingDelete
                                      .value)
                                  ? const Text(
                                      "Confirm",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromARGB(255, 227, 0, 0),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  : Transform.scale(
                                      scale: 0.8,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 15.w),
                                        child: const CircularProgressIndicator(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                            ),
                          );
                        });
                      });
                }
                break;
              default:
            }
          },
        ),
        children: [
          SizedBox(
            height: 8.h,
          ),
          transactionTime(context),
          transactionDate(),
          TransactionDescriptionView(
            content: Get.find<TransactionsController>()
                .transactions[index]
                .description,
            title: 'Description',
          ),
        ],
      ),
    );
  }

  TransactionDescriptionView transactionTime(BuildContext context) {
    DateTime dateTime = DateFormat("HH:mm").parse(
        Get.find<TransactionsController>().transactions[index].selecttime);
    final timeDay = DateFormat.jm().format(dateTime);
    return TransactionDescriptionView(
      content: timeDay,
      // Get.find<TransactionsController>().transactions[index].selecttime,
      title: 'Time',
    );
  }

  TimeOfDay stringToTimeOfDay(String tod) {
    final format = DateFormat.jm(); //"6:00 AM"
    return TimeOfDay.fromDateTime(format.parse(tod));
  }

  TransactionDescriptionView transactionDate() {
    final dateOg =
        Get.find<TransactionsController>().transactions[index].selectdate;
    final year = dateOg.year;
    final monthOg = dateOg.month;
    final dayOg = dateOg.day;
    final month = (monthOg.toString().length == 1) ? '0$monthOg' : monthOg;
    final day = (dayOg.toString().length == 1) ? '0$dayOg' : dayOg;
    final date = '$day.$month.$year';
    return TransactionDescriptionView(
      content: date,
      title: 'Date',
    );
  }
}
