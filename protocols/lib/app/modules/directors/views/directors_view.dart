import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors/views/directors_card_view.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectorsView extends GetView<DirectorsController> {
  const DirectorsView({Key? key}) : super(key: key);
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
                'Directors',
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
            (Get.find<DirectorsController>().directorsList.isEmpty)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(
                      child: Text(
                        'No Directors!',
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: GetBuilder<DirectorsController>(
                        init: DirectorsController(),
                        builder: (_) {
                          return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                final director = Get.find<DirectorsController>()
                                    .directorsList[index];
                                return DirectorsCardView(
                                  director: director,
                                );
                              },
                              separatorBuilder: (BuildContext context, index) {
                                return const SizedBox(
                                  height: 30,
                                );
                              },
                              itemCount: Get.find<DirectorsController>()
                                  .directorsList
                                  .length);
                        }),
                  ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          right: 10.w,
        ),
        child: const DirectorsButtonView(),
      ),
    );
  }
}
