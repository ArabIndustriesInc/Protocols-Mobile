import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';

class NotesEditController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<Widget> subTasks = [];
  int count = 0;
  var loadingEdit = false.obs;
  int controllerIndex = 0;
  List<TextEditingController> controllers = [];
  addController(TextEditingController controller) {
    controllerIndex++;
    controllers.add(controller);
    update();
  }

  var initTimes = 0.obs;
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
          scrollPhysics: const BouncingScrollPhysics(),
          maxLines: 5,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'Montserrat Medium',
          ),
          validator: ((value) {
            if (value!.isEmpty) {
              return "This field is required!";
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
              hintStyle: TextStyle(
                fontFamily: 'Montserrat Medium',
                fontSize: 15.sp,
                color: const Color(0xffADADAD),
              )),
          controller: controller,
        ),
      ));
    updateCount();
  }
}
