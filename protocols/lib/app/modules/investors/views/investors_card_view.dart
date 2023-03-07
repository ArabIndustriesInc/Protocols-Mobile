import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/data/providers/investors_provider.dart';
import 'package:protocols/app/modules/consts/empinvdir_consts.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:protocols/app/modules/investors_details/bindings/investors_details_binding.dart';
import 'package:protocols/app/modules/investors_details/views/investors_details_view.dart';

class InvestorsCardView extends GetView {
  final int index;
  const InvestorsCardView({Key? key, required this.index}) : super(key: key);
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
                      'Are you sure, you want to delete the investor? This action can\'t be reversed!',
                  title: 'Delete Investor',
                  action: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: () {
                      if (!Get.find<InvestorsController>()
                          .loadingDelete
                          .value) {
                        final id =
                            Get.find<InvestorsController>().investors[index].id;
                        InvestorsProvider().deleteInvestor(id, context);
                      }
                    },
                    child: Obx(() {
                      return (Get.find<InvestorsController>()
                              .loadingDelete
                              .value)
                          ? Transform.scale(
                              scale: 0.6,
                              child: const CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 1.7,
                              ),
                            )
                          : const Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xffE30000),
                                fontWeight: FontWeight.normal,
                              ),
                            );
                    }),
                  ),
                );
              });
        },
        onPressed: () {
          Get.to(
            () => InvestorsDetailsView(
              index: index,
            ),
            binding: InvestorsDetailsBinding(),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageApi(
                      Get.find<InvestorsController>().investors[index].image),
                  SizedBox(
                    width: 20.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Get.find<InvestorsController>().investors[index].firstname} ${Get.find<InvestorsController>().investors[index].lastname}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          Get.find<InvestorsController>()
                              .investors[index]
                              .mobile,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xff716A6A),
                          ),
                        ),
                        Text(
                          Get.find<InvestorsController>()
                              .investors[index]
                              .email,
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
                  'Investor',
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

  Widget imageApi(String img) {
    try {
      return EmpInvDirImageShow(
          img: img,
          image: ClipRRect(
            borderRadius: BorderRadius.circular(12.h),
            child: Image(
                height: 80.h,
                width: 70.w,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
                image: NetworkImage(
                  img,

                  // headers: {"Authorization": "Bearer $token"},
                )),
          ));
    } catch (e) {
      log(e.toString());
      return Text(
        '${Get.find<InvestorsController>().investors[index].firstname}.png',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      );
    }
  }
}
