import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';

class TodoEditController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController =
      TextEditingController(text: 'Lorem ipsum dolor sit amet');
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
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          maxLines: 3,
          style: const TextStyle(fontSize: 14),
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
              hintText: 'Enter section ${count + 1}...',
              hintStyle: const TextStyle(
                color: Color(0xffADADAD),
              )),
          controller: controller,
        ),
      ));
    updateCount();
  }
}

class ToDoEditButton extends GetView {
  const ToDoEditButton({super.key});

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
                Get.back();
                SnackbarMessage()
                    .snackBarMessage('Task edited successfully!', context);
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
