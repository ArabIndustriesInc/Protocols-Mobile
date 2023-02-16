import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/employees_details/views/employee_details_card_view.dart';
import 'package:protocols/app/modules/investors_edit/bindings/investors_edit_binding.dart';
import 'package:protocols/app/modules/investors_edit/views/investors_edit_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestorsDetailsController extends GetxController {
  List<Widget> personalDetails = const [
    EmpDrsInvTableContent(
      content: '10.10.1988',
      title: 'D.O.B',
    ),
    EmpDrsInvTableContent(
      content: '+411 085 185 165',
      title: 'Mob No.',
    ),
    EmpDrsInvTableContent(
      content: 'johnwick@mail.com',
      title: 'Mail ID',
    ),
    EmpDrsInvTableContent(
      content: 'James Wick',
      title: 'Fathers name',
    ),
    EmpDrsInvTableContent(
      content: 'ABCD12345678',
      title: 'PAN No.',
    ),
    EmpDrsInvTableContent(
      content:
          'Lorem ipsum dolor sit, consetetur sadipscing elitr,sed diam nonumy eirmod tempor invidunt 0985644, tempor invidunt 0985644',
      title: 'Address',
    ),
  ];
  List<Widget> shareDetails = [
    Container(
      height: 10,
      color: Colors.transparent,
    ),
    // Center(
    //   child: CircularPercentIndicator(
    //     radius: 75.0,
    //     lineWidth: 15.0,
    //     percent: 0.62,
    //     center: const Text(
    //       "62%",
    //       style: TextStyle(color: Color(0xff1F78B4), fontSize: 20),
    //     ),
    //     progressColor: const Color(0xff1F78B4),
    //   ),
    // ),
    const EmpDrsInvTableContent(
      content: '100\$',
      title: 'Avg Price Per share',
    ),
    const EmpDrsInvTableContent(
      content: '100\$',
      title: 'Current Price per Share',
    ),
    const EmpDrsInvTableContent(
      content: '100\$',
      title: 'Total no.of shares',
    ),
    Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff036BBF),
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Text('View Share History'),
      ),
    )
  ];
}

class InvestorsDetailsButtonView extends GetView {
  final int index;
  const InvestorsDetailsButtonView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
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
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(.35.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                Get.to(
                  () => InvestorsEditView(index: index),
                  binding: InvestorsEditBinding(),
                );
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(12.w),
                  minimumSize: Size.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
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
