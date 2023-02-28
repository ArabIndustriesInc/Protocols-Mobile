import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/transaction_model.dart';
import 'package:protocols/app/data/providers/transaction_provider.dart';
import 'package:protocols/app/routes/app_pages.dart';

class TransactionsController extends GetxController {
  final BuildContext context;
  final List<String> menuItems = ['Edit', 'Delete'];
  List<Transactions> transactions = [];
  var loading = true.obs;
  var loadingDelete = false.obs;

  TransactionsController(this.context);
  getAllTransactions() async {
    await TransactionsProvider().getAllTransactions(context);
    update();
  }

  @override
  void onClose() {
    TransactionsProvider.isFinishedTransactions = true;
    TransactionsProvider().onClose();
    super.onClose();
  }

  @override
  void onInit() async {
    getAllTransactions();
    update();
    super.onInit();
  }
}

class TransButtonView extends GetView {
  const TransButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.TRANSACTIONS_ADD);
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 35.w,
        ),
      ),
    );
  }
}
