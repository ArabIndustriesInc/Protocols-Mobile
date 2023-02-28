import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PricingPlanController extends GetxController {
  WebViewController webViewController = WebViewController();
  final List<Data> list = Data.generate();
  var listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle.obs;
  @override
  void onInit() {
    listScrollController.addListener(() {
      scrollDirection.value = listScrollController.position.userScrollDirection;
    });
    // webViewController.loadRequest(
    //   Uri.parse('data:text/html;base64,${base64Encode(
    //     const Utf8Encoder().convert(stripeCheckoutPage),
    //   )}'),
    // );
    webViewController.loadHtmlString(stripeCheckoutPage);
    super.onInit();
  }

  final String stripeCheckoutPage = '''
  <!DOCTYPE html>
  <html>
  <body>
<script async src="https://js.stripe.com/v3/pricing-table.js"></script>
<stripe-pricing-table pricing-table-id="prctbl_1MfKD8B6CWPxK0IB9WSly17r"
publishable-key="pk_live_51JqYykB6CWPxK0IB5I2GXjdObdjF3UVjJMOqURritxYjKeD76KRq2nsRrnMFv0zfBl5aRtLwPcsfOFUDrnwbck4t00SKdX4Gk3">
</stripe-pricing-table>
</body>
</body>
  </html>
''';

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

