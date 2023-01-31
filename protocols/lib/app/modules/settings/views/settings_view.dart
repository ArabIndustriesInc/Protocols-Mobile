import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/settings_appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';
import 'package:protocols/app/modules/settings/views/profile_header_view.dart';
import 'package:protocols/app/modules/settings/views/settings_card_view.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSetting().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const ProfileHeaderView(
                email: 'johnwick@gmail.com',
                image: 'assets/images/profile_pic.png',
                name: 'John Wick',
                phNo: '9374987203',
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              const ProfileContents(
                content: '10.12.1989',
                title: 'DOB',
              ),
              const ProfileContents(
                content: 'Jonathan Wick',
                title: 'Father\'s Name',
              ),
              const ProfileContents(
                content: 'KDJFJRJNJS',
                title: 'PAN No',
              ),
              const ProfileContents(
                content:
                    ' Lorem ipsum dolor sit, consetetur sadipscing elitr,eirmod tempor invidunt 0985644',
                title: 'Address',
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SettingsCardView(
                image: 'assets/icons/reset_password.svg',
                title: 'Change Password',
                onTap: () {},
                color: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              SettingsCardView(
                image: 'assets/icons/dark_mode.svg',
                title: 'Dark Mode',
                onTap: () {},
                color: Colors.black12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
