import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/modules/dashboard/views/dashboard_investors_view.dart';
import 'package:protocols/app/modules/dashboard/views/dashboard_view.dart';
import 'package:protocols/app/modules/links/views/links_view.dart';

class HomeController extends GetxController {
  final pages = [
    Column(
      children: [
        Flexible(
          child: (box.read('company_role') == '0')
              ? DashboardView()
              : DashboardInvestorsView(),
        ),
      ],
    ),
    const LinksView(),
  ];
  RxInt page = 0.obs;
  bottomNav(newIndex) {
    page.value = newIndex;
    // log('new index: ${newIndex.toString()}');
    // log('page value: ${page.value.toString()}');
    update();
  }

  Directory? dir;
  Directory? appStorage;
  getDir() async {
    dir = await getTemporaryDirectory();
    appStorage = await getApplicationDocumentsDirectory();
    // log(dir!.path);
  }

  @override
  void onInit() {
    getDir();
    super.onInit();
  }
}
