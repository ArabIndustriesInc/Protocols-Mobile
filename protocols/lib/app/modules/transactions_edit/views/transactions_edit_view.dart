import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:protocols/app/modules/transactions_edit/controllers/transactions_edit_controller.dart';
import 'package:protocols/app/modules/transactions_edit/controllers/transactions_edit_date_controller.dart';
import 'package:protocols/app/modules/transactions_edit/views/transactions_edit_field_view.dart';

class TransactionsEditView extends GetView<TransactionsEditController> {
  final int index;
  const TransactionsEditView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initValue(context);
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Text(
                  'Edit Transaction',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              TransactionsEditFieldView(
                date: Get.find<TransactionsController>()
                    .transactions[index]
                    .selectdate
                    .toString(),
                time: Get.find<TransactionsController>()
                    .transactions[index]
                    .selecttime,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: TransactionsEditButton(
          id: Get.find<TransactionsController>().transactions[index].id),
    );
  }

  initValue(BuildContext context) {
    Get.find<TransactionsEditController>().transTypeValue.value =
        (Get.find<TransactionsController>().transactions[index].type == '-')
            ? 'Expense'
            : 'Income';
    Get.find<TransactionsEditController>().amountController.text =
        Get.find<TransactionsController>().transactions[index].amount;
    Get.find<TransactionsEditController>().transNameController.text =
        Get.find<TransactionsController>().transactions[index].title;
    Get.find<TransactionsEditController>().descController.text =
        Get.find<TransactionsController>().transactions[index].description;
    Get.find<TransactionsEditDateController>().initDate(
        Get.find<TransactionsController>()
            .transactions[index]
            .selectdate
            .toString(),
        context);
    Get.find<TransactionsEditDateController>().initTime(
        Get.find<TransactionsController>().transactions[index].selecttime,
        context);
  }
}
