import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/voting_provider.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/voting/controllers/voting_controller.dart';
import 'package:protocols/app/modules/voting_details/bindings/voting_details_binding.dart';
import 'package:protocols/app/modules/voting_details/views/voting_details_view.dart';

class VotingCardView extends GetView<VotingController> {
  final int index;
  const VotingCardView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            color: const Color(0xffABC2D4).withOpacity(.5),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return Obx(() {
                  return DeleteAlertView(
                    subtitle:
                        'Are you sure, you want to delete this vote? This action can\'t be reversed!',
                    title: 'Delete Transaction',
                    action: InkWell(
                      highlightColor: Colors.grey[200],
                      onTap: () {
                        if (!Get.find<VotingController>().loadingDelete.value) {
                          final id =
                              Get.find<VotingController>().votes[index].id;
                          VotingProvider().deleteVote(id, context);
                        }
                      },
                      child: (!Get.find<VotingController>().loadingDelete.value)
                          ? const Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(255, 227, 0, 0),
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          : Transform.scale(
                              scale: 0.8,
                              child: Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: const CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                    ),
                  );
                });
              });
        },
        onPressed: () {
          Get.to(() => VotingDetailsView(index: index),
              binding: VotingDetailsBinding());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                Get.find<VotingController>().votes[index].title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  letterSpacing: .3,
                  color: Colors.black,
                  fontFamily: 'Montserrat Bold',
                ),
              ),
            ),
            voteDate(),
          ],
        ),
      ),
    );
  }

  Text voteDate() {
    final voteDate =
        Get.find<VotingController>().votes[index].selectdate.toString();
    return Text(
      '${DateTime.parse(voteDate).day}-${DateTime.parse(voteDate).month}-${DateTime.parse(voteDate).year}',
      style: TextStyle(
        fontSize: 14.sp,
        color: const Color.fromARGB(255, 255, 116, 116),
      ),
    );
  }
}
