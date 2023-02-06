import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/todo_model.dart';
import 'package:protocols/app/data/providers/todo_provider.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo_edit/controllers/todo_edit_date_controller.dart';

class TodoEditController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  var loadingEdit = false.obs;
  // List<Widget> subTasks = [];
  // int count = 0;
  // int controllerIndex = 0;
  // List<TextEditingController> controllers = [];
  // addController(TextEditingController controller) {
  //   controllerIndex++;
  //   controllers.add(controller);
  //   update();
  // }

  // updateCount() {
  //   count++;
  //   update();
  // }

  // void add() {
  //   // log(count.toString());
  //   TextEditingController controller = TextEditingController();
  //   addController(controller);
  //   subTasks = List.from(subTasks)
  //     ..add(Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 10.0),
  //       child: TextFormField(
  //         maxLines: 3,
  //         style: const TextStyle(fontSize: 14),
  //         validator: ((value) {
  //           if (value!.isEmpty) {
  //             return "This field should be filled!";
  //           } else {
  //             return null;
  //           }
  //         }),
  //         decoration: taskDeco,
  //         controller: controller,
  //       ),
  //     ));
  //   updateCount();
  // }
}

class ToDoEditButton extends GetView {
  final int index;
  const ToDoEditButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 25, bottom: 10.h, top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 23.w,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            label: Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                if (!Get.find<TodoEditController>().loadingEdit.value) {
                  if (Get.find<TodoEditController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    Get.find<TodoEditController>().loadingEdit.value = true;
                    final title = Get.find<TodoEditController>()
                        .titleController
                        .text
                        .trim();
                    final task = Get.find<TodoEditController>()
                        .taskController
                        .text
                        .trim();
                    final deadline =
                        (Get.find<TodoEditDateController>().pickedDateToDo ==
                                Get.find<TodoEditDateController>().todayDay)
                            ? Get.find<TodoController>()
                                .todoDetails[index]
                                .todoid
                                .deadline
                                .toString()
                            : Get.find<TodoEditDateController>()
                                .pickedDateToDo
                                .toString();
                    // final deadline =
                    //     (Get.find<TodoEditDateController>().pickedDateToDo)
                    //         .toString();

                    log(deadline.toString());
                    final todo =
                        AddTodo(title: title, deadline: deadline, task: task);
                    final id =
                        Get.find<TodoController>().todoDetails[index].todoid.id;
                    TodoProvider().editTodo(todo, id, context);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Obx(() {
                return (Get.find<TodoEditController>().loadingEdit.value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.7,
                        ),
                      )
                    : Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 30.h,
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
