import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo_add/controllers/todo_add_date_controller.dart';

class TodoAddController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<Widget> subTasks = [];
  int count = 0;
  int controllerIndex = 0;
  List<TextEditingController> controllers = [];
  addController(TextEditingController controller) {
    controllerIndex++;
    controllers.add(controller);
    update();
  }

  updateCount() {
    count++;
    update();
  }

  void add() {
    // log(count.toString());
    TextEditingController controller = TextEditingController();
    addController(controller);
    subTasks = List.from(subTasks)
      ..add(Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: TextFormField(
          maxLines: 4,
          style: TextStyle(fontSize: 14.sp),
          validator: ((value) {
            if (value!.isEmpty) {
              return "This field should be filled!";
            } else {
              return null;
            }
          }),
          decoration: InputDecoration(
              focusedErrorBorder: textDeco,
              errorBorder: textDeco,
              contentPadding: const EdgeInsets.all(19),
              focusedBorder: textDeco,
              enabledBorder: textDeco,
              hintText: 'Enter task ${count + 1}...',
              hintStyle: const TextStyle(
                color: Color(0xffADADAD),
              )),
          controller: controller,
        ),
      ));
    updateCount();
  }

  @override
  void onInit() {
    super.onInit();
    add();
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
                if (Get.find<TodoAddController>()
                    .formKey
                    .currentState!
                    .validate()) {
                  List<SubTaskModel> subTasks = [];
                  final title =
                      Get.find<TodoAddController>().titleController.text.trim();
                  final no = Get.find<TodoAddController>().subTasks.length;
                  for (var i = 0; i < no; i++) {
                    String task =
                        Get.find<TodoAddController>().controllers[i].text;
                    var subTask = SubTaskModel(task: task, isDone: false);
                    subTasks.add(subTask);
                  }
                  final dueDate = Get.find<TodoAddDateController>()
                      .pickedDateToDo
                      .toString();
                  final todo = ToDoModel(
                      title: title, dueDate: dueDate, subTasks: subTasks);
                  Get.find<TodoController>().add(todo);
                  Get.find<TodoController>().update();
                  Get.back();
                  SnackbarMessage()
                      .snackBarMessage('New task added successfully!', context);
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 30.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
