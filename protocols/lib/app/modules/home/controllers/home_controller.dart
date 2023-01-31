import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/dashboard/views/dashboard_view.dart';
import 'package:protocols/app/modules/links/views/links_view.dart';

class HomeController extends GetxController {
  final pages = [
    Column(
      children: [
        Flexible(
          child: DashboardView(),
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
}
