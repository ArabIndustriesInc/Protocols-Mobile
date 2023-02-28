import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo_details/controllers/todo_detais_controller.dart';
import 'package:protocols/app/modules/todo_details/views/task_list_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoDetaisView extends GetView<TodoDetaisController> {
  final int index;
  const TodoDetaisView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Obx(
                () => ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Center(
                        child: Text(
                          Get.find<TodoController>()
                              .todoDetails[index]
                              .todoid
                              .title,
                          style: TextStyle(
                            fontSize: 25.sp,
                            letterSpacing: .9,
                            fontFamily: 'Montserrat Black',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 15,
                              children: [todoDate()],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Wrap(
                              direction: Axis.horizontal,
                              runSpacing: 15,
                              children: const [
                                TodoDetailsDateTimeCard(
                                  subTitle: '1',
                                  title: 'Total tasks',
                                  icon: Icons.pending_actions_rounded,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Text(
                        'Task',
                        style: TextStyle(
                          fontSize: 20.sp,
                          letterSpacing: .9,
                          fontFamily: 'Montserrat Bold',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TaskListCardView(
                        task:
                            Get.find<TodoController>().todoDetails[index].task)
                    // ListView.builder(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   itemBuilder: (BuildContext context, no) {
                    //     final task = todo.subTasks[no].task;
                    //     return TaskListCardView(task: task);
                    //   },
                    //   itemCount: todo.subTasks.length,
                    // ),
                  ],
                ),
              ))),
      bottomNavigationBar: ToDoDetailsButtonView(index: index),
    );
  }

  TodoDetailsDateTimeCard todoDate() {
    final date = Get.find<TodoController>()
        .todoDetails[index]
        .todoid
        .deadline
        .toString();
    return TodoDetailsDateTimeCard(
      title: 'Due Date',
      subTitle:
          '${DateTime.parse(date).day}-${DateTime.parse(date).month}-${DateTime.parse(date).year}',
      icon: FontAwesomeIcons.calendarCheck,
    );
  }
}
       //   Padding(
            //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.w),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15.w),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       border: Border.all(
            //         color: const Color.fromARGB(255, 209, 209, 209),
            //         width: 1,
            //       ),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Get.find<VotingController>().votes[index].description sdhf kaksdjfhaskd hfkasdj fhas',
            //           textAlign: TextAlign.justify,
            //           style: TextStyle(
            //               fontSize: 14.sp, fontFamily: 'Montserrat Medium'),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),