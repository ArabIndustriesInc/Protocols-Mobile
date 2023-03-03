import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';
import 'package:protocols/app/modules/notes_edit/controllers/notes_edit_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/notes_edit/widgets/notes_edit_button.dart';

class NotesEditView extends GetView<NotesEditController> {
  final int index;
  const NotesEditView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Get.find<NotesEditController>().initTimes.value <= 1) {
      initValue();
    }
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Form(
          key: Get.find<NotesEditController>().formKey,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Text(
                  'Edit Notes',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              const Text(
                'Title: ',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Bold',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                scrollPhysics: const BouncingScrollPhysics(),
                controller: Get.find<NotesEditController>().titleController,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Title is required!";
                  } else {
                    return null;
                  }
                }),
                decoration: InputDecoration(
                  focusedErrorBorder: textDeco,
                  errorBorder: textDeco,
                  focusedBorder: textDeco,
                  contentPadding: const EdgeInsets.all(19),
                  enabledBorder: textDeco,
                  hintText: 'Title...',
                ),
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Montserrat Medium',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Description: ',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                scrollPhysics: const BouncingScrollPhysics(),
                controller: Get.find<NotesEditController>().contentController,
                keyboardType: TextInputType.multiline,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Description is required!";
                  } else {
                    return null;
                  }
                }),
                maxLines: 20,
                decoration: InputDecoration(
                  focusedErrorBorder: textDeco,
                  errorBorder: textDeco,
                  focusedBorder: textDeco,
                  contentPadding: const EdgeInsets.all(19),
                  enabledBorder: textDeco,
                  hintStyle:
                      const TextStyle(color: Color(0xffADADAD), fontSize: 14),
                  hintText: 'Enter description...',
                ),
                style: TextStyle(
                  fontFamily: 'Montserrat Medium',
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       'Sections: ',
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontFamily: 'Montserrat Bold',
              //       ),
              //     ),
              //     IconButton(
              //         onPressed: () {
              //           Get.find<NotesEditController>().add();
              //         },
              //         icon: const Icon(
              //           Icons.add_rounded,
              //           color: Colors.black,
              //           size: 25,
              //         ))
              //   ],
              // ),
              // GetBuilder<NotesEditController>(builder: ((_) {
              //   return Column(
              //     children: Get.find<NotesEditController>().subTasks,
              //   );
              // })),
            ],
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NotesEditButton(
        index: index,
      ),
    );
  }

  initValue() {
    Get.find<NotesEditController>().initTimes.value++;
    // for (var i = 0; i < Get.find<NotesController>().notes[index].noteid
    //       .sections.length; i++) {
    //   Get.find<NotesEditController>().add();
    //   Get.find<NotesEditController>().controllers[i].text = notes.sections[i];
    // }
    Get.find<NotesEditController>().titleController.text =
        Get.find<NotesController>().notes[index].title;
    Get.find<NotesEditController>().contentController.text =
        Get.find<NotesController>().notes[index].description;
  }
}
