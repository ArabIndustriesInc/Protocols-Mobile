import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentGatewayController extends GetxController {
  String taxPrice(String plan) {
    double tax = 0;
    if (plan == 'Trial Plan') {
      tax = (2 * (12 / 100));
      return tax.toStringAsFixed(2);
    } else if (plan == 'Standard Plan') {
      tax = (59.99 * (12 / 100));
      return tax.toStringAsFixed(2);
    } else {
      tax = (99.99 * (12 / 100));
      return tax.toStringAsFixed(2);
    }
  }

  String planPrice(String plan) {
    double price = 0;
    double tax = 0;
    if (plan == 'Trial Plan') {
      tax = (2 * (12 / 100));
      price = 2 + tax;
      return price.toStringAsFixed(2);
    } else if (plan == 'Standard Plan') {
      tax = (59.99 * (12 / 100));
      price = 59.99 + tax;
      return price.toStringAsFixed(2);
    } else {
      tax = (99.99 * (12 / 100));
      price = 99.99 + tax;
      return price.toStringAsFixed(2);
    }
  }

  final paymentAppBar = AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.west_rounded,
            size: 30.w,
            color: const Color(0xff2D9CEA),
          )),
    ),
    actions: [
      Center(
        child: Text(
          'Check Out',
          style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'Montserrat SemiBold',
              color: Colors.grey[600]),
        ),
      ),
      const SizedBox(
        width: 30,
      )
    ],
  );
  final CardFormEditController cardController = CardFormEditController();
}

final boxDeco = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      offset: const Offset(0, 4),
      blurRadius: 20,
      color: const Color(0xffABC2D4).withOpacity(.3),
    ),
  ],
);
final cardForm = CardFormField(
  controller: Get.find<PaymentGatewayController>().cardController,
  style: CardFormStyle(
    borderWidth: 20,
    borderRadius: 10,
    placeholderColor: Colors.grey[600],
    borderColor: Colors.white,
    cursorColor: Colors.grey[600],
    textColor: Colors.grey[600],
  ),
);
final style = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)));

Padding billHeadMethod(String title) {
  return Padding(
    padding: EdgeInsets.all(10.h),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 15.sp,
        fontFamily: 'Montserrat Bold',
      ),
    ),
  );
}

Text totalPrice(String plan) {
  String price = Get.find<PaymentGatewayController>().planPrice(plan);
  String total = '\$ ';
  return Text(
    total + price,
    style: TextStyle(
      color: Colors.grey[600],
      fontSize: 15.sp,
      fontFamily: 'Montserrat Bold',
    ),
  );
}

Text ogPrice(String plan) {
  String price;
  switch (plan) {
    case 'Trial Plan':
      price = "\$ 2";
      break;
    case 'Standard Plan':
      price = "\$ 59.99";
      break;
    default:
      price = "\$ 99.99";
  }
  return Text(
    price,
    style: TextStyle(
      color: Colors.grey[400],
      fontSize: 15.sp,
      fontFamily: 'Montserrat Bold',
    ),
  );
}

Text taxPrice(String plan) {
  String price = Get.find<PaymentGatewayController>().taxPrice(plan);
  String tax = '\$ ';
  return Text(
    tax + price,
    style: TextStyle(
      color: Colors.grey[400],
      fontSize: 15.sp,
      fontFamily: 'Montserrat Bold',
    ),
  );
}

Text billingText(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.grey[400],
      fontSize: 15.sp,
      fontFamily: 'Montserrat Bold',
    ),
  );
}
