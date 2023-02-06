import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/notes_model.dart';
import 'package:protocols/app/data/providers/notes_provider.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';
import 'package:protocols/app/modules/notes_edit/controllers/notes_edit_controller.dart';

class NotesEditButton extends GetView {
  final int index;
  const NotesEditButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                if (!Get.find<NotesEditController>().loadingEdit.value) {
                  if (Get.find<NotesEditController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    Get.find<NotesEditController>().loadingEdit.value = true;
                    final title = Get.find<NotesEditController>()
                        .titleController
                        .text
                        .trim();
                    final description = Get.find<NotesEditController>()
                        .contentController
                        .text
                        .trim();
                    final note = AddNotes(
                      title: title,
                      description: description,
                    );
                    final id = Get.find<NotesController>().notes[index].id;
                    NotesProvider().editNote(note, context, id);
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
                return (Get.find<NotesEditController>().loadingEdit.value)
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
