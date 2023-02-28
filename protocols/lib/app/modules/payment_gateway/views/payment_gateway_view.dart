import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/payment_gateway/controllers/payment_gateway_controller.dart';
import 'package:protocols/app/modules/payment_gateway/views/payment_success_view.dart';
import 'package:protocols/app/modules/payment_gateway/widgets/payment_gateway_widgets.dart';

class PaymentGatewayView extends GetView<PaymentGatewayController> {
  final String plan;
  const PaymentGatewayView({Key? key, required this.plan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaymentWidgtes().paymentAppBar,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 25.h,
              child: Image.asset(
                'assets/images/logo.png',
                width: 60.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            PaymentWidgtes().billHeadMethod('Billing Details'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: PaymentWidgtes().boxDeco,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PaymentWidgtes().billingText('Order Summary'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentWidgtes().billingText('Order'),
                      PaymentWidgtes().ogPrice(plan)
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentWidgtes().billingText('Tax'),
                      PaymentWidgtes().taxPrice(plan),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15.sp,
                          fontFamily: 'Montserrat Bold',
                        ),
                      ),
                      PaymentWidgtes().totalPrice(plan),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            PaymentWidgtes().billHeadMethod('Payment Details'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: PaymentWidgtes().boxDeco,
              child: PaymentWidgtes().cardForm,
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const PaymentSuccessView());
          },
          style: PaymentWidgtes().style,
          child: const Text(
            'Pay',
            style: TextStyle(
              letterSpacing: .9,
              fontFamily: 'Montserrat Bold',
            ),
          ),
        ),
      ),
    );
  }
}
