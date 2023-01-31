import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoController extends GetxController {
  final List<String> menuItems = ['Edit', 'Delete'];
  List<ToDoModel> toDoList = [];
  add(ToDoModel todo) {
    toDoList.add(todo);
    update();
  }
}

class ToDoModel {
  final String title;
  final String dueDate;
  final List<SubTaskModel> subTasks;

  ToDoModel({
    required this.title,
    required this.dueDate,
    required this.subTasks,
  });
}

class SubTaskModel {
  final String task;
  final bool isDone;

  SubTaskModel({
    required this.task,
    required this.isDone,
  });
}

class ToDoButtonView extends GetView {
  const ToDoButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.TODO_ADD);
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 35.w,
        ),
      ),
    );
  }
}
