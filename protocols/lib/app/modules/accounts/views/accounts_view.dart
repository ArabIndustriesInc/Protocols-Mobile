import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:protocols/app/modules/accounts/views/accounts_card_view.dart';
import 'package:protocols/app/modules/accounts/views/accs_button_view.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
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
                'Accounts',
                style: TextStyle(
                    fontSize: 25.sp,
                    letterSpacing: .9,
                    fontFamily: 'Montserrat Black'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Obx(() => (Get.find<AccountsController>().loading.value)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(child: CircularProgressIndicator()))
                : GetBuilder<AccountsController>(builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return (Get.find<AccountsController>()
                                    .accounts
                                    .isEmpty)
                                ? const EmptyDashMessage(title: 'No Accounts!')
                                : AccsCardView(
                                    index: index,
                                  );
                          },
                          itemCount:
                              (Get.find<AccountsController>().accounts.isEmpty)
                                  ? 1
                                  : controller.accounts.length),
                    );
                  }))
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(right: 10, bottom: 10),
        child: AccsButtonView(),
      ),

      // FloatingActionButton(
      //   onPressed: () {
      //     print(Get.find<AccountsController>().accounts.length);
      //   },
      // )
    );
  }
}
