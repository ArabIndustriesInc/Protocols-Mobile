import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/todo_details/controllers/todo_detais_controller.dart';

class TaskListCardView extends GetView<TodoDetaisController> {
  final String task;
  const TaskListCardView({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: const Color.fromARGB(255, 6, 27, 72).withOpacity(.15),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Obx(
            //   () => (Get.find<TodoDetaisController>().done.value == true)
            //       ? const Icon(
            //           Icons.check_circle_outline_outlined,
            //           size: 25,
            //           color: Color(0xff036BBF),
            //         )
            //       :
            Icon(
              Icons.circle_rounded,
              size: 10.w,
              color: Colors.black,
            ),
            // ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  task,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 152, 152, 152),
                      fontFamily: 'Metropolis Medium'),
                ),
              ),
            ),
            // PopupMenuButton(
            //   shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(15))),
            //   itemBuilder: (context) {
            //     return (Get.find<TodoDetaisController>().done.value == true)
            //         ? Get.find<TodoDetaisController>()
            //             .menuItemsDone
            //             .map((e) =>
            //                 PopupMenuItem<String>(value: e, child: Text(e)))
            //             .toList()
            //         : Get.find<TodoDetaisController>()
            //             .menuItems
            //             .map((e) =>
            //                 PopupMenuItem<String>(value: e, child: Text(e)))
            //             .toList();
            //   },
            //   onSelected: (value) {
            //     switch (value) {
            //       case 'Done':
            //         {
            //           Get.find<TodoDetaisController>().updateDone();
            //           SnackbarMessage()
            //               .snackBarMessage('Task done successfully!', context);
            //         }
            //         break;
            //       case 'Undo':
            //         {
            //           Get.find<TodoDetaisController>().updateDone();
            //           SnackbarMessage().snackBarMessage(
            //               'Task undone successfully!', context);
            //         }
            //         break;
            //       case 'Delete':
            //         {
            //           showDialog(
            //               context: context,
            //               builder: (context) {
            //                 return DeleteAlertView(
            //                   subtitle:
            //                       'Are you sure, you want to delete this sub-task? This action can\'t be reversed!',
            //                   title: 'Delete Sub-Task',
            //                   action: InkWell(
            //                     highlightColor: Colors.grey[200],
            //                     onTap: () {
            //                       Get.back();
            //                       SnackbarMessage().snackBarMessage(
            //                           'Sub-Task deleted successfully!',
            //                           context);
            //                     },
            //                     child: const Text(
            //                       "Confirm",
            //                       style: TextStyle(
            //                         fontSize: 15.0,
            //                         color: Color.fromARGB(255, 227, 0, 0),
            //                         fontWeight: FontWeight.normal,
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               });
            //         }
            //         break;
            //       default:
            //     }
            //   },
            //   child: const Icon(
            //     Icons.more_vert_rounded,
            //     color: Colors.black,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
// TextButton(
//   onPressed: () {
//     Get.find<TodoDetaisController>().updateDone();
//   },
//   style: TextButton.styleFrom(
//       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       padding: EdgeInsets.zero,
//       minimumSize: Size.zero),
//   child: Obx(
//     () => (Get.find<TodoDetaisController>().done.value == true)
//         ? const Icon(
//             Icons.check_circle_outline_outlined,
//             size: 34,
//             color: Color(0xff036BBF),
//           )
//         : const Icon(
//             Icons.panorama_fish_eye_rounded,
//             size: 34,
//             color: Color(0xff4EC1F2),
//           ),
//   ),
// ),
