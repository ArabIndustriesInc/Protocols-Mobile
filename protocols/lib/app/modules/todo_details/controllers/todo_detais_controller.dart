import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/todo_edit/bindings/todo_edit_binding.dart';
import 'package:protocols/app/modules/todo_edit/views/todo_edit_view.dart';

class TodoDetaisController extends GetxController {
  List menuItems = ['Done', 'Delete'];
  List menuItemsDone = ['Undo', 'Delete'];
  var done = true.obs;
  updateDone() {
    done.value = !done.value;
    update();
  }

  updateDelete() {
    done.value = !done.value;
    update();
  }
}

class TodoDetailsDateTimeCard extends GetView {
  final String title;
  final IconData icon;
  final String subTitle;
  const TodoDetailsDateTimeCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xffEAF3FE),
        // color: const Color.fromARGB(255, 218, 255, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: MediaQuery.of(context).size.width / 29,
                  color: const Color(0xff676767),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    size: (icon == Icons.pending_actions_rounded) ? 22 : 20,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 30,
                      color: Colors.black,
                    ),
                  )
                  // (title == 'Due Date')
                  //     ? Text(
                  //         subTitle,
                  //         style: TextStyle(
                  //           fontSize: MediaQuery.of(context).size.width / 30,
                  //           color: Colors.black,
                  //         ),
                  //       )
                  //     : Obx(() => Text(
                  //           subTitle,
                  //           style: TextStyle(
                  //             fontSize: 14.sp,
                  //             color: Colors.black,
                  //           ),
                  //         )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ToDoDetailsButtonView extends GetView {
  final int index;
  const ToDoDetailsButtonView({super.key, required this.index});

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
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 25.w,
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            label: Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 17.sp),
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
                Get.to(
                  () => TodoEditView(index: index),
                  binding: TodoEditBinding(),
                );
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(14.h),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Icon(
                FontAwesomeIcons.filePen,
                color: Colors.white,
                size: 18.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
