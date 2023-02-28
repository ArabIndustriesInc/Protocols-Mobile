// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/account_details/controllers/account_details_controller.dart';
import 'package:protocols/app/modules/account_details/controllers/account_logo_controller.dart';
import 'package:protocols/app/modules/account_details/views/acc_details_card_view.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as p;

class AccountDetailsView extends GetView<AccountDetailsController> {
  final int index;
  const AccountDetailsView({
    Key? key,
    required this.index,
  }) : super(key: key);
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
                  'Bank Account',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 11.3),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                        color: const Color(0xffABC2D4).withOpacity(.8),
                      ),
                    ],
                  ),
                  child: AspectRatio(aspectRatio: 12 / 2, child: bankLogo()),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AccDetailsCardView(index: index),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AccDetailsButtonView(),
    );
  }

  Widget bankLogo() {
    final bankName = Get.find<AccountsController>().accounts[index].bankname;
    final img = Get.find<AccountLogoController>().bankLogo(bankName);
    final ext = p.extension(img);
    if (ext != '.svg') {
      return Image(
        image: NetworkImage(img),
        fit: BoxFit.contain,
      );
    } else {
      return SvgPicture.network(
        img,
        fit: BoxFit.contain,
      );
    }
  }
}
