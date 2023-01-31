import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/directors_details/bindings/directors_details_binding.dart';
import 'package:protocols/app/modules/directors_details/views/directors_details_view.dart';

class DirectorsCardView extends GetView {
  final DirectorsModel director;
  const DirectorsCardView({Key? key, required this.director}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 251, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 4),
            blurRadius: 4,
            color: Colors.black.withOpacity(.28),
          ),
        ],
      ),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
            top: 15.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return DeleteAlertView(
                  subtitle:
                      'Are you sure, you want to delete the director? This action can\'t be reversed!',
                  title: 'Delete Director',
                  action: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      Get.back();
                      SnackbarMessage().snackBarMessage(
                          'Director deleted successfully!', context);
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 227, 0, 0),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                );
              });
        },
        onPressed: () {
          Get.to(
            () => DirectorsDetailsView(
              director: director,
            ),
            binding: DirectorsDetailsBinding(),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.h),
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(12.h),
                    //     topRight: Radius.circular(12.h)),
                    child: Image(
                      height: 75.h,
                      width: 70.w,
                      fit: BoxFit.cover,
                      image: MemoryImage(
                        const Base64Decoder().convert(director.image),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${director.fName} ${director.lName}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          director.mobNo,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xff716A6A),
                          ),
                        ),
                        Text(
                          director.emailID,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xff716A6A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Divider(
              height: 1,
              thickness: 3,
              color: Color.fromARGB(255, 226, 238, 251),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'Director',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
