import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/voting_add/controllers/voting_add_controller.dart';

class VotingAddView extends GetView<VotingAddController> {
  const VotingAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Center(
              child: Text(
                'Add Voting',
                style: TextStyle(
                    fontSize: 23.sp,
                    letterSpacing: .9,
                    fontFamily: 'Montserrat Black'),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: Get.find<VotingAddController>().formKey,
                child: Wrap(
                  runSpacing: 10.h,
                  children: [
                    Text(
                      'Title: ',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Montserrat Bold',
                      ),
                    ),
                    TextFormField(
                      controller:
                          Get.find<VotingAddController>().titleController,
                      scrollPhysics: const BouncingScrollPhysics(),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Title is required!";
                        } else {
                          return null;
                        }
                      }),
                      decoration: InputDecoration(
                        focusedErrorBorder: textDeco,
                        errorBorder: textDeco,
                        focusedBorder: textDeco,
                        contentPadding: const EdgeInsets.all(19),
                        enabledBorder: textDeco,
                        hintText: 'Enter Title...',
                      ),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Montserrat Medium',
                      ),
                    ),
                    Container(
                      height: 5.h,
                      padding: EdgeInsets.all(10.h),
                    ),
                    Text(
                      'Description: ',
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 16.sp,
                      ),
                    ),
                    TextFormField(
                      controller:
                          Get.find<VotingAddController>().contentController,
                      scrollPhysics: const BouncingScrollPhysics(),
                      keyboardType: TextInputType.multiline,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Description is required!";
                        } else {
                          return null;
                        }
                      }),
                      maxLines: 13,
                      decoration: InputDecoration(
                        focusedErrorBorder: textDeco,
                        errorBorder: textDeco,
                        focusedBorder: textDeco,
                        contentPadding: const EdgeInsets.all(19),
                        enabledBorder: textDeco,
                        hintStyle: TextStyle(
                            color: const Color(0xffADADAD), fontSize: 14.sp),
                        hintText: 'Enter description...',
                      ),
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const VotesAddButton(),
    );
  }
}
  // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     TimePickCardVoting(
                    //       icon: Icons.alarm,
                    //       subTitle: 'Time',
                    //       title: Obx(
                    //         () => Text(
                    //           Get.find<VotingAddDateController>()
                    //               .selectedTime
                    //               .value,
                    //           style: TextStyle(
                    //               color: Colors.black, fontSize: 16.sp),
                    //         ),
                    //       ),
                    //       iconSize: 30.h,
                    //     ),
                    //     DatePickCardVoting(
                    //       icon: Icons.calendar_today,
                    //       subTitle: 'Date',
                    //       title: Obx(
                    //         () => Text(
                    //           "${Get.find<VotingAddDateController>().todayDate.value} ${Get.find<VotingAddDateController>().todayMonth.value} '${Get.find<VotingAddDateController>().yrShort.value}",
                    //           style: TextStyle(
                    //               color: Colors.black, fontSize: 16.sp),
                    //         ),
                    //       ),
                    //       iconSize: 30.h,
                    //     ),
                    //   ],
                    // ),