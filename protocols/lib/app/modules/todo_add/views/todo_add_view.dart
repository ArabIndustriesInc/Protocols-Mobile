import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/todo_add/controllers/todo_add_controller.dart';
import 'package:protocols/app/modules/todo_add/controllers/todo_add_date_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoAddView extends GetView<TodoAddController> {
  const TodoAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Text(
              'Edit Task',
              style: TextStyle(
                  fontSize: 25.sp,
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
              key: Get.find<TodoAddController>().formKey,
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
                    controller: Get.find<TodoAddController>().titleController,
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
                        hintStyle: const TextStyle(
                          color: Color(0xffADADAD),
                        )),
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  Container(
                    height: 5.h,
                    padding: EdgeInsets.all(10.h),
                  ),
                  ToDoDueDatePickCardAdd(
                    icon: Icons.calendar_today,
                    subTitle: 'Due Date',
                    title: Obx(
                      () => Text(
                        "${Get.find<TodoAddDateController>().todayDateToDo.value} ${Get.find<TodoAddDateController>().todayMonthToDo.value} '${Get.find<TodoAddDateController>().yrShortToDo.value}",
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                    ),
                    iconSize: 25.w,
                  ),
                  Container(
                    height: 10.h,
                    padding: EdgeInsets.all(10.h),
                  ),
                  Text(
                    'Task: ',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Montserrat Bold',
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Task: ',
                  //       style: TextStyle(
                  //         fontSize: 18.sp,
                  //         fontFamily: 'Montserrat Bold',
                  //       ),
                  //     ),
                  //     TextButton(
                  //         style: TextButton.styleFrom(
                  //             padding: const EdgeInsets.all(7),
                  //             minimumSize: Size.zero,
                  //             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //             shape: const CircleBorder()),
                  //         onPressed: () {
                  //           Get.find<TodoAddController>().add();
                  //         },
                  //         child: Icon(
                  //           Icons.add_rounded,
                  //           color: Colors.black,
                  //           size: 22.w,
                  //         ))
                  //   ],
                  // ),
                  Container(
                    height: .5.h,
                    padding: EdgeInsets.all(10.h),
                  ),
                  TextFormField(
                    maxLines: 3,
                    style: const TextStyle(fontSize: 14),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "This field should be filled!";
                      } else {
                        return null;
                      }
                    }),
                    decoration: taskDeco,
                    controller: Get.find<TodoAddController>().taskController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const ToDoAddButton(),
    );
  }
}
