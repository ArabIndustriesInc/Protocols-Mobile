import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:protocols/app/modules/pricing_plan/controllers/pricing_plan_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends GetView<PricingPlanController> {
  const PaymentWebView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentWebViewView'),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: Get.find<PricingPlanController>().webViewController,
      ),
    );
  }
}
