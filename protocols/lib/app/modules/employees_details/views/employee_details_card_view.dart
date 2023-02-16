import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/employees_edit/bindings/employees_edit_binding.dart';
import 'package:protocols/app/modules/employees_edit/views/employees_edit_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmpDrsInvDetailsCardView extends GetView {
  final String title;
  final List<Widget> contents;
  const EmpDrsInvDetailsCardView(
      {Key? key, required this.contents, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xffEEF5FB),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 3),
                  blurRadius: 7,
                  color: Colors.black.withOpacity(.28),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 45.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16.sp, fontFamily: 'Montserrat Bold'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 20.w,
                    right: 20.w,
                    bottom: 30.h,
                  ),
                  child: Wrap(
                    runSpacing: 20,
                    children: contents,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}

class EmpDrsInvTableContent extends GetView {
  final String title;
  final String content;
  const EmpDrsInvTableContent(
      {Key? key, required this.content, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.8,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat SemiBold',
                  color: const Color(0xff464646),
                ),
              ),
            ),
            Text(':',
                style: TextStyle(
                  fontSize: 14.sp,
                ))
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: Text(
            content,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Montserrat Medium',
              color: const Color(0xff5E5E5E),
            ),
          ),
        ),
      ],
    );
  }
}

class EmployeesDetailsButtonView extends GetView {
  final int index;
  const EmployeesDetailsButtonView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                Get.to(
                    () => EmployeesEditView(
                          index: index,
                        ),
                    binding: EmployeesEditBinding());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                shadowColor: Colors.transparent,
                padding: EdgeInsets.all(12.w),
              ),
              child: Icon(
                FontAwesomeIcons.userPen,
                color: Colors.white,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
