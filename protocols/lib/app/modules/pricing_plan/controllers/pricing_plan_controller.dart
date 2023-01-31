import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class PricingPlanController extends GetxController {
  final List<Data> list = Data.generate();
  var listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle.obs;
  @override
  void onInit() {
    listScrollController.addListener(() {
      scrollDirection.value = listScrollController.position.userScrollDirection;
    });
    super.onInit();
  }

  bool scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      scrollDirection.value = ScrollDirection.idle;
    }
    return true;
  }
}

class Data {
  String title;
  String img;
  int color;
  String price;
  List<String> features;

  Data(this.title, this.img, this.color, this.price, this.features);

  static List<Data> generate() {
    return [
      Data(
        "Trial Plan",
        "assets/images/human1.png",
        0xFF5ACAFA,
        '2',
        ['10 members', '24/7 support'],
      ),
      Data(
        "Standard Plan",
        "assets/images/human2.png",
        0xFF1DAAE6,
        '59.99',
        [
          '20 members',
          'personal profile',
          'api integration',
          '24/7 support',
        ],
      ),
      Data(
        "Enterprise Plan",
        "assets/images/human3.png",
        0xFF5ACAFA,
        '99.99',
        [
          'unlimited members',
          'personal spaces',
          'api integration',
          'custom themes',
          'priority support',
          '24/7 support',
        ],
      ),
    ];
  }
}
// 0xFF6FD4FF,
// 0xFF1DAAE6,

