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
  final ToDoModel todo;
  const TodoDetaisView({Key? key, required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Text(
                  todo.title,
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
                      children: [
                        TodoDetailsDateTimeCard(
                          title: 'Due Date',
                          subTitle: todo.dueDate.substring(0, 10),
                          icon: FontAwesomeIcons.calendarCheck,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 15,
                      children: [
                        TodoDetailsDateTimeCard(
                          subTitle: todo.subTasks.length.toString(),
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
              height: 15.h,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, no) {
                final task = todo.subTasks[no].task;
                return TaskListCardView(task: task);
              },
              itemCount: todo.subTasks.length,
            ),
          ],
        ),
      )),
      bottomNavigationBar: ToDoDetailsButtonView(todo: todo),
    );
  }
}
