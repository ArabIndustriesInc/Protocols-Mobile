import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/consts/theme_const.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/notes_add/controllers/notes_add_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/notes_add/widgets/notes_add_button.dart';

class NotesAddView extends GetView<NotesAddController> {
  const NotesAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar(context),
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Form(
          key: Get.find<NotesAddController>().formKey,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Text(
                  'Add Notes',
                  style: TextStyle(
                      fontSize: 23.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                'Title: ',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'Montserrat Bold',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Get.find<NotesAddController>().titleController,
                scrollPhysics: const BouncingScrollPhysics(),
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
              Text(
                'Description: ',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 16.sp,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Get.find<NotesAddController>().contentController,
                scrollPhysics: const BouncingScrollPhysics(),
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
              //           Get.find<NotesAddController>().add();
              //         },
              //         icon: const Icon(
              //           Icons.add_rounded,
              //           color: Colors.black,
              //           size: 25,
              //         ))
              //   ],
              // ),
              // GetBuilder<NotesAddController>(builder: ((_) {
              //   return Column(
              //     children: Get.find<NotesAddController>().subTasks,
              //   );
              // })),
            ],
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NotesAddButton(),
    );
  }
}
