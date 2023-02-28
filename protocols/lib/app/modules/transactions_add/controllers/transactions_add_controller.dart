import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/transaction_model.dart';
import 'package:protocols/app/data/providers/transaction_provider.dart';
import 'package:protocols/app/modules/transactions_add/controllers/transactions_add_date_controller.dart';

class TransactionsAddController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController transNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  var loadingAdd = false.obs;
  RxString transTypeValue = 'Income'.obs;
  var transType = [
    'Income',
    'Expense',
  ];

  updatePriortiy(String? newValue) {
    transTypeValue.value = newValue!;
    update();
  }
}

class TransactionsAddButton extends StatelessWidget {
  const TransactionsAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        top: 15.h,
        right: 25,
        bottom: 15.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 23.w,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            label: Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                if (!Get.find<TransactionsAddController>().loadingAdd.value) {
                  if (Get.find<TransactionsAddController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    Get.find<TransactionsAddController>().loadingAdd.value =
                        true;
                    final transactionName =
                        Get.find<TransactionsAddController>()
                            .transNameController
                            .text
                            .trim();
                    final amount = Get.find<TransactionsAddController>()
                        .amountController
                        .text
                        .trim();
                    final description = Get.find<TransactionsAddController>()
                        .descController
                        .text
                        .trim();
                    final date = Get.find<TransactionsAddDateController>()
                        .pickedDate
                        .toString()
                        .substring(0, 10);
                    final timeOfDay =
                        Get.find<TransactionsAddDateController>().pickedTime;
                    final hour = (timeOfDay.hour.toString().length > 1)
                        ? timeOfDay.hour
                        : '0${timeOfDay.hour}';
                    final minute = (timeOfDay.minute.toString().length > 1)
                        ? timeOfDay.minute
                        : '0${timeOfDay.hour}';
                    final time = ('$hour:$minute');
                    final typeController = Get.find<TransactionsAddController>()
                        .transTypeValue
                        .value;
                    final type = (typeController == 'Expense') ? '-' : '+';
                    final transaction = AddTransactions(
                      title: transactionName,
                      amount: amount,
                      description: description,
                      selecttime: time.toString(),
                      selectdate: date,
                      type: type,
                    );

                    TransactionsProvider().addTransaction(transaction, context);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Obx(() {
                return (Get.find<TransactionsAddController>().loadingAdd.value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.7,
                        ),
                      )
                    : Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 30.h,
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
