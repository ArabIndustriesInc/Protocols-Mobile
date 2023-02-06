import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/voting_details/controllers/voting_details_controller.dart';

class VotingDetailsCardView extends GetView<VotingDetailsController> {
  final String bullet;
  final String option;
  final GestureTapCallback onPressed;
  const VotingDetailsCardView({
    Key? key,
    required this.bullet,
    required this.onPressed,
    required this.option,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 10,
              color: const Color.fromARGB(255, 143, 153, 183).withOpacity(.2),
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.only(
                right: 40.w, left: 25.w, top: 20.h, bottom: 20.h),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return DeleteAlertView(
                  subtitle:
                      'Are you sure about your choice? Caution! This action can\'t be reversed!',
                  title: 'Warining',
                  action: InkWell(
                    highlightColor: Colors.grey[200],
                    onTap: onPressed,
                    child: Obx(() {
                      return (Get.find<VotingDetailsController>()
                              .loadingVoteStatus
                              .value)
                          ? Transform.scale(
                              scale: 0.6,
                              child: const CircularProgressIndicator(
                                color: Colors.blue,
                                strokeWidth: 1.7,
                              ),
                            )
                          : Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 15.h,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            );
                    }),
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '$bullet )   ',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    option,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat Medium',
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Obx(() {
                final count = (option == 'No')
                    ? Get.find<VotingDetailsController>().countNo.toString()
                    : Get.find<VotingDetailsController>().countYes.toString();
                return (Get.find<VotingDetailsController>()
                        .loadingVoteStatus
                        .value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: const CircularProgressIndicator(
                          color: Colors.blue,
                          strokeWidth: 1.7,
                        ),
                      )
                    : Text(
                        (count == '100') ? '' : count,
                        style: TextStyle(
                          fontSize: 15.h,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
