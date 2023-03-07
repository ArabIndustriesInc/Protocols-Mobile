import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/pricing_consts.dart';
// import 'package:protocols/app/modules/payment_gateway/bindings/payment_gateway_binding.dart';
// import 'package:protocols/app/modules/payment_gateway/views/payment_gateway_view.dart';
import 'package:protocols/app/modules/pricing_plan/controllers/pricing_plan_controller.dart';
import 'package:protocols/app/modules/pricing_plan/views/payment_web_view_view.dart';

class PricingPlanView extends GetView<PricingPlanController> {
  final String title;
  const PricingPlanView({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBarPrice().pricingAppBar,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: 'Montserrat Black',
                      color: const Color(0xFF3F8FD1),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NotificationListener<ScrollNotification>(
                      onNotification:
                          Get.find<PricingPlanController>().scrollNotification,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        controller: Get.find<PricingPlanController>()
                            .listScrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: Get.find<PricingPlanController>()
                              .list
                              .map((item) {
                            return Obx(
                              () => AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                transform: Matrix4.rotationZ(
                                    Get.find<PricingPlanController>()
                                                .scrollDirection
                                                .value ==
                                            ScrollDirection.forward
                                        ? 0.07
                                        : Get.find<PricingPlanController>()
                                                    .scrollDirection
                                                    .value ==
                                                ScrollDirection.reverse
                                            ? -0.07
                                            : 0),
                                width: MediaQuery.of(context).size.width / 1.4,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 20.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 30.h),
                                decoration: BoxDecoration(
                                    color: Color(item.color),
                                    borderRadius: BorderRadius.circular(16.h),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(item.color)
                                              .withOpacity(0.6),
                                          offset: const Offset(-6, 4),
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    titleText(item),
                                    divider,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '\$',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp,
                                              fontFamily: 'Montserrat Medium'),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          item.price,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40.sp,
                                            fontFamily: 'Montserrat Bold',
                                          ),
                                        ),
                                      ],
                                    ),
                                    textTime,
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                    Wrap(
                                      runSpacing: 20.h,
                                      children: item.features.map((feature) {
                                        return PriceContents(content: feature);
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => const PaymentWebView());
                                        // Get.to(
                                        //   () => PaymentGatewayView(
                                        //       plan: item.title),
                                        //   binding: PaymentGatewayBinding(),
                                        // );
                                      },
                                      style: style,
                                      child: (item.title == 'Enterprise Plan')
                                          ? buttonText('Contact')
                                          : buttonText('Buy Now'),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Swipe to explore',
                style: TextStyle(fontSize: 17.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.east_rounded,
                size: 30.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
