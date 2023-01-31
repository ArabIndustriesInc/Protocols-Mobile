import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:protocols/app/modules/transactions/views/transactions_card_view.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom().appBar,
        drawer: DrawerView(),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20.0),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 25.sp,
                    letterSpacing: .9,
                    fontFamily: 'Montserrat Black',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 30),
                  child: Obx(
                    () => (Get.find<TransactionsController>().loading.value)
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: const Center(
                                child: CircularProgressIndicator()))
                        : GetBuilder<TransactionsController>(
                            init: TransactionsController(),
                            builder: (_) {
                              return (Get.find<TransactionsController>()
                                      .transactions
                                      .isEmpty)
                                  ? const EmptyDashMessage(
                                      title: 'No Transactions!')
                                  : ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return TransactionsCardView(
                                          index: index,
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            right: 30.h,
                                          ),
                                          child: Divider(
                                            color: Colors.black26,
                                            height: 25.h,
                                          ),
                                        );
                                      },
                                      itemCount: (Get.find<
                                                  TransactionsController>()
                                              .transactions
                                              .isEmpty)
                                          ? 1
                                          : Get.find<TransactionsController>()
                                              .transactions
                                              .length);
                            }),
                  )),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(right: 10, bottom: 10),
          child: TransButtonView(),
        ));
  }
}
