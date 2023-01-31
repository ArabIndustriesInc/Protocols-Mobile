import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo_edit/controllers/todo_edit_controller.dart';
import 'package:protocols/app/modules/todo_edit/controllers/todo_edit_date_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoEditView extends GetView<TodoEditController> {
  final ToDoModel todo;
  const TodoEditView({Key? key, required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initValue();
    return Scaffold(
      appBar: AppBarCustom().appBar,
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
              key: Get.find<TodoEditController>().formKey,
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
                    controller: Get.find<TodoEditController>().titleController,
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
                  ToDoDueDatePickCardEdit(
                    date: todo.dueDate,
                    icon: Icons.calendar_today,
                    subTitle: 'Due Date',
                    title: Obx(
                      () => Text(
                        "${Get.find<TodoEditDateController>().todayDateToDo.value} ${Get.find<TodoEditDateController>().todayMonthToDo.value} '${Get.find<TodoEditDateController>().yrShortToDo.value}",
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                    ),
                    iconSize: 25.w,
                  ),
                  Container(
                    height: 1.h,
                    padding: EdgeInsets.all(10.h),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Tasks: ',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Montserrat Bold',
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(7),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const CircleBorder()),
                          onPressed: () {
                            Get.find<TodoEditController>().add();
                          },
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.black,
                            size: 22.w,
                          ))
                    ],
                  ),
                  Container(
                    height: .5.h,
                    padding: EdgeInsets.all(10.h),
                  ),
                  GetBuilder<TodoEditController>(builder: ((_) {
                    return Column(
                      children: Get.find<TodoEditController>().subTasks,
                    );
                  })),
                ],
              ),
            ),
          ),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const ToDoEditButton(),
    );
  }

  void initValue() {
    final date = DateTime.parse(todo.dueDate);
    Get.find<TodoEditDateController>().initDateToDo(date);
    Get.find<TodoEditController>().titleController.text = todo.title;
    for (var i = 0; i < todo.subTasks.length; i++) {
      Get.find<TodoEditController>().add();
      Get.find<TodoEditController>().controllers[i].text =
          todo.subTasks[i].task;
    }
  }
}
