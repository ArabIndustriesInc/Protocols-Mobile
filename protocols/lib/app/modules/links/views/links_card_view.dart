// import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LinksCardView extends GetView {
  final String image;
  final String name;
  final String link;
  final String desc;
  const LinksCardView({
    Key? key,
    required this.image,
    required this.link,
    required this.name,
    required this.desc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(129, 100, 100, 100),
            width: 1.3,
          ),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 3,
              offset: Offset(10, 10),
              blurRadius: 15,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ],
        ),
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 1,
            ),
            SvgPicture.asset(
              image,
              height: 70.h,
            ),
            Column(
              children: [
                Text(
                  name,
                  style:
                      TextStyle(fontFamily: 'Montserrat Bold', fontSize: 20.sp),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  desc,
                  style: TextStyle(fontSize: 15.sp),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () async {
                    // await LaunchApp.openApp(
                    //     androidPackageName: link,
                    //     iosUrlScheme: 'googlegmail://',
                    //     appStoreLink:
                    //         'https://apps.apple.com/us/app/gmail-email-by-google');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Move to ',
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 10,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
