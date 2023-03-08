// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/drawer/views/contents_view.dart';
import 'package:protocols/app/modules/settings/bindings/settings_binding.dart';
import 'package:protocols/app/modules/settings/views/settings_view.dart';
import 'package:protocols/app/routes/app_pages.dart';

class DrawerView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(
                0xffECF5FF,
              ),
            ),
            child: DrawerHeadingContents(),
          ),
          const SizedBox(
            height: 20,
          ),
          DashbaordNavButtons(
            title: 'Dashboard',
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
          ),
          DashbaordNavButtons(
            title: 'Profile',
            onTap: () async {
              Scaffold.of(context).closeDrawer();
              Get.to(() => const SettingsView(),
                  binding: SettingsBinding(homeContext!));
            },
          ),
          DashbaordNavButtons(
            title: 'Pricing',
            onTap: () {
              Scaffold.of(context).closeDrawer();
              Get.toNamed(Routes.UPGRADE_PLAN);
            },
          ),
          DashbaordNavButtons(
            title: 'Logout',
            onTap: () {
              Scaffold.of(context).closeDrawer();
              showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteAlertView(
                      subtitle:
                          'Are you sure, you want to logout from this account?',
                      title: 'Logout',
                      action: InkWell(
                        highlightColor: Colors.grey[200],
                        onTap: () {
                          Get.back();
                          Get.offAllNamed(Routes.WELCOME);
                          box.write('login_token', '');
                          box.write('paid_user', false);
                          SnackbarMessage().snackBarMessage(
                              'Logged out successfully!', context);
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 227, 0, 0),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
