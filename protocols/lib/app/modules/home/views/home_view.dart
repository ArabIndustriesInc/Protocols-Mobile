import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/dashboard/views/dashboard_view.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/home/controllers/home_controller.dart';
import 'package:protocols/app/modules/links/views/links_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    homeContext = context;
    return Scaffold(
      drawer: DrawerView(),
      appBar: AppBarCustom().appBar(context),
      backgroundColor: Colors.white,
      // body: Container());
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15.0),
          child: Obx(
            () => IndexedStack(
              index: Get.find<HomeController>().page.value,
              children: [
                Column(
                  children: [
                    Flexible(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [DashboardView()],
                      ),
                    ),
                  ],
                ),
                const LinksView(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNavBarView(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const FloatingButtonView(),
    );
  }
}
