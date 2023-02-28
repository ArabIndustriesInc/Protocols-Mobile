import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/add_account/controllers/add_account_controller.dart';
import 'package:protocols/app/modules/add_account/views/add_acc_button_view.dart';
import 'package:protocols/app/modules/add_account/views/add_acc_field_view.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAccountView extends GetView<AddAccountController> {
  const AddAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                  'Add Accounts',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              const AddAccFieldView(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AddAccButtonView(),
    );
  }
}
