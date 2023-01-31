import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashbaordNavButtons extends GetView {
  final String title;
  final GestureTapCallback onTap;
  const DashbaordNavButtons(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 19.sp,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
          size: 15.w,
        ));
  }
}

class DrawerHeadingContents extends StatelessWidget {
  const DrawerHeadingContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Color(0xff2D9CEA),
                  size: 33,
                ),
              );
            }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
          ),
          child: Builder(builder: (context) {
            return Center(
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  Get.toNamed(Routes.HOME);
                },
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width / 1.7,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
