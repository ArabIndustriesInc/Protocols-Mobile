import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/notes/controllers/notes_controller.dart';
import 'package:protocols/app/modules/notes/views/notes_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/notes/widgets/button_widgets.dart';

class NotesView extends GetView<NotesController> {
  const NotesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20.0),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 23,
            ),
            Center(
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 25.sp,
                  letterSpacing: .9,
                  fontFamily: 'Montserrat Black',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Obx(
              () => (Get.find<NotesController>().loading.value)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(child: CircularProgressIndicator()))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: GetBuilder<NotesController>(
                          init: NotesController(),
                          builder: (_) {
                            return ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, index) {
                                  return (Get.find<NotesController>()
                                          .notes
                                          .isEmpty)
                                      ? const EmptyDashMessage(
                                          title: 'No Notes!')
                                      : NotesCardView(
                                          index: index,
                                        );
                                },
                                separatorBuilder:
                                    (BuildContext context, index) {
                                  return const SizedBox(
                                    height: 30,
                                  );
                                },
                                itemCount: (Get.find<NotesController>()
                                        .notes
                                        .isEmpty)
                                    ? 1
                                    : Get.find<NotesController>().notes.length);
                          }),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          right: 10.w,
        ),
        child: const NotesButtonView(),
      ),
    );
  }
}
