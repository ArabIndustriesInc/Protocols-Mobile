import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeView extends GetView {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 70.h,
            ),
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 251.w,
            ),
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              'assets/images/login.png',
              height: 233.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 27.sp, fontFamily: 'Montserrat Bold'),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 55,
              ),
              child: Text(
                'Your comfort is our key, we have perks of several platforms under one roof to make yourself better each day. Come check this out!',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 15.sp, fontFamily: 'Montserrat Medium'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 52, 52, 52)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
                backgroundColor: Colors.white,
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shadowColor: const Color.fromARGB(255, 204, 204, 204),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontFamily: 'Montserrat SemiBold'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 // Container(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 3, horizontal: 45),
                //   decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: const Color.fromARGB(255, 52, 52, 52)
                //         .withOpacity(0.5),
                //     spreadRadius: 2,
                //     blurRadius: 6,
                //     offset: const Offset(0, 3),
                //   ),
                // ],
                //       borderRadius: BorderRadius.circular(15),
                //       gradient: const LinearGradient(
                //           colors: [Color(0xff1F7DE5), Color(0xff2EB4F1)],
                //           begin: Alignment.topCenter,
                //           end: Alignment.bottomCenter)),
                //   child: TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       'Login',
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontFamily: 'Montserrat SemiBold',
                //           color: Colors.white),
                //     ),
                //   ),
                // ),