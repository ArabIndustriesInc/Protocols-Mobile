import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/payment_gateway/controllers/payment_gateway_controller.dart';

class PaymentWidgtes {
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
      case 'Start-up Plan':
        price = "Start-up Plan";
        break;
      case 'Scale-up Plan':
        price = "Scale-up Plan";
        break;
      default:
        price = "Stable Plan";
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
    // String price = Get.find<PaymentGatewayController>().taxPrice(plan);
    String tax = '\$ 0.99';
    return Text(
      tax,
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
}
