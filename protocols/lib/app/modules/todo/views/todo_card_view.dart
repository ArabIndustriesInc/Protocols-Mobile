import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/todo_provider.dart';
import 'package:protocols/app/modules/delete_alert/views/delete_alert_view.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo_details/bindings/todo_detais_binding.dart';
import 'package:protocols/app/modules/todo_details/views/todo_detais_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoCardView extends GetView<TodoController> {
  final int index;
  const TodoCardView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 13.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          // border: Border.all(width: .6, color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              blurRadius: 4,
              color: const Color(0xffABC2D4).withOpacity(.8),
            ),
          ],
        ),
        child: TextButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            Get.to(() => TodoDetaisView(index: index),
                binding: TodoDetaisBinding());
          },
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Obx(() {
                    return DeleteAlertView(
                      subtitle:
                          'Are you sure, you want to delete this task? This action can\'t be reversed!',
                      title: 'Delete Task',
                      action: InkWell(
                        highlightColor: Colors.grey[200],
                        onTap: () {
                          if (!Get.find<TodoController>().loadingDelete.value) {
                            final id = Get.find<TodoController>()
                                .todoDetails[index]
                                .todoid
                                .id;
                            TodoProvider().deleteTodo(id, context);
                          }
                        },
                        child: (!Get.find<TodoController>().loadingDelete.value)
                            ? const Text(
                                "Confirm",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFFE30000),
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            : Transform.scale(
                                scale: 0.8,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: const CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                      ),
                    );
                  });
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  Get.find<TodoController>().todoDetails[index].todoid.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    letterSpacing: .3,
                  ),
                ),
              ),
              todoDate(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              // Text(
              //   '$percent% is complete',
              //   style: TextStyle(
              //     fontSize: 13.sp,
              //     fontFamily: 'Montserrat Medium',
              //     color: const Color(0xff127817),
              //   ),
              // ),

              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Text todoDate() {
    final date = Get.find<TodoController>()
        .todoDetails[index]
        .todoid
        .deadline
        .toString();
    return Text(
      '${DateTime.parse(date).day}-${DateTime.parse(date).month}-${DateTime.parse(date).year}',
      style: TextStyle(
        fontSize: 11.5.sp,
        color: const Color(0xffA00101),
        fontFamily: 'Montserrat Medium',
      ),
    );
  }
}
  // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   color: Colors.white,
        //   border: Border.all(width: .6, color: Colors.grey),
        //   boxShadow: const [
        //     BoxShadow(
        //       spreadRadius: 3,
        //       offset: Offset(3, 4),
        //       blurRadius: 12,
        //       color: Color.fromRGBO(0, 0, 0, 0.16),
        //     ),
        //   ],
        // ),

          // TextButton(
                  //   onPressed: () {},
                  //   style: TextButton.styleFrom(
                  //       padding: EdgeInsets.zero,
                  //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //       minimumSize: Size.zero),
                  //   child: const Icon(
                  //     Icons.more_vert_outlined,
                  //     color: Colors.black,
                  //   ),
                  // )

                    // switch (value) {
                      //   case 'Edit':
                      //     {
                      //       Get.put(TransFieldController());
                      //       if (index.isEven) {
                      //         Get.find<TransFieldController>()
                      //             .updateType('Expense');
                      //       } else {
                      //         Get.find<TransFieldController>()
                      //             .updateType('Income');
                      //       }
                      //       Get.toNamed(Routes.ADDTRANSACTIONS);
                      //     }
                      //     break;
                      //   case 'Delete':
                      //     {}
                      //     break;
                      //   default:
                      // }


                  //     PopupMenuButton(
                  //   padding: EdgeInsets.zero,
                  //   icon: const Icon(
                  //     Icons.more_vert_rounded,
                  //     color: Colors.black,
                  //   ),
                  //   shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(15))),
                  //   itemBuilder: (context) {
                  //     return Get.find<TodoController>()
                  //         .menuItems
                  //         .map((e) =>
                  //             PopupMenuItem<String>(value: e, child: Text(e)))
                  //         .toList();
                  //   },
                  //   onSelected: (value) {},
                  // ),