import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';
import 'package:protocols/app/modules/notes_details/controllers/notes_details_controller.dart';
import 'package:protocols/app/modules/notes_edit/bindings/notes_edit_binding.dart';
import 'package:protocols/app/modules/notes_edit/views/notes_edit_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesDetailsView extends GetView<NotesDetailsController> {
  final int index;
  const NotesDetailsView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Obx(
              () => ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              Get.find<NotesController>()
                                  .notesDetails[index]
                                  .noteid
                                  .title,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 21.sp,
                                letterSpacing: .9,
                                fontFamily: 'Montserrat Black',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      Get.to(
                        () => NotesEditView(index: index),
                        binding: NotesEditBinding(),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 45, vertical: 30),
                          child: Text(
                            Get.find<NotesController>()
                                .notesDetails[index]
                                .noteid
                                .description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'Montserrat Medium',
                                fontSize: 14.sp),
                          ),
                        ),
                        // (notes.sections.isEmpty)
                        //     ? const SizedBox()
                        //     : ListView.builder(
                        //         physics: const NeverScrollableScrollPhysics(),
                        //         shrinkWrap: true,
                        //         itemBuilder: (BuildContext context, index) {
                        //           final section = notes.sections[index];
                        //           return BulletListCardView(
                        //             section: section,
                        //           );
                        //         },
                        //         itemCount: notes.sections.length),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      bottomNavigationBar: NotesDetailsButton(
        index: index,
      ),
    );
  }
}
