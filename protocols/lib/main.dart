import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';
import 'app/routes/app_pages.dart';
import '.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  box.write('paid_user', false);
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Protocols",
          initialRoute: initRoute,
          defaultTransition: Transition.cupertino,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme: appTheme,
        );
      },
    ),
  );
}
