import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/routes/app_pages.dart';

final appTheme = ThemeData(
  textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 20.sp)),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      overlayColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.black12;
        }
        return Colors.transparent;
      }),
    ),
  ),
  fontFamily: 'Montserrat SemiBold',
  primaryColor: const Color(0xff2D9CEA),
);

final textDeco = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Color(0xffCBCBCB), width: .8),
);
String token = box.read('login_token') ?? '';
final initRoute = (token.isEmpty) ? AppPages.INITIAL : Routes.HOME;
// final initRoute = Routes.PRICING_PLAN;
