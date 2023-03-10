import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/pricing_plan/controllers/pricing_plan_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends GetView<PricingPlanController> {
  const PaymentWebView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      appBar: AppBarCustom().appBar(context),
      body: SafeArea(
        child: WebViewWidget(
          layoutDirection: TextDirection.rtl,
          controller: Get.find<PricingPlanController>().webViewController,
        ),
      ),
    );
  }
}
