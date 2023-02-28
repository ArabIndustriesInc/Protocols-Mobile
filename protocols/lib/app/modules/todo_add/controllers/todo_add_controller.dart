import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/todo_model.dart';
import 'package:protocols/app/data/providers/todo_provider.dart';
import 'package:protocols/app/modules/todo_add/controllers/todo_add_date_controller.dart';

class TodoAddController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  var loadingAdd = false.obs;

  @override
  void onClose() {
    TodoProvider.isFinishedTodo = true;
    TodoProvider().onClose();
    super.onClose();
  }
}

class ToDoAddButton extends GetView {
  const ToDoAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 25,
        bottom: 15.h,
        top: 15.h,
      ),
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
                if (!Get.find<TodoAddController>().loadingAdd.value) {
                  if (Get.find<TodoAddController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    Get.find<TodoAddController>().loadingAdd.value = true;
                    final title = Get.find<TodoAddController>()
                        .titleController
                        .text
                        .trim();
                    final task = Get.find<TodoAddController>()
                        .taskController
                        .text
                        .trim();
                    final deadline = Get.find<TodoAddDateController>()
                        .pickedDateToDo
                        .toString();
                    final todo =
                        AddTodo(title: title, deadline: deadline, task: task);
                    TodoProvider().addTodo(todo, context);
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
                return (Get.find<TodoAddController>().loadingAdd.value)
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
