import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentGatewayController extends GetxController {
  final CardFormEditController cardController = CardFormEditController();
  // String taxPrice(String plan) {
  //   double tax = 0;
  //   if (plan == 'Trial Plan') {
  //     tax = (2 +0.99);
  //     return tax.toStringAsFixed(2);
  //   } else if (plan == 'Standard Plan') {
  //     tax = (59.99 +0.99);
  //     return tax.toStringAsFixed(2);
  //   } else {
  //     tax = (99.99 +0.99);
  //     return tax.toStringAsFixed(2);
  //   }
  // }

  String planPrice(String plan) {
    double price = 0;
    double tax = 0;
    if (plan == 'Trial Plan') {
      tax = (0.99);
      price = 2 + tax;
      return price.toStringAsFixed(2);
    } else if (plan == 'Standard Plan') {
      tax = (0.99);
      price = 4 + tax;
      return price.toStringAsFixed(2);
    } else {
      tax = (0.99);
      price = 10 + tax;
      return price.toStringAsFixed(2);
    }
  }

  Map<String, dynamic>? paymentIntent;
}
