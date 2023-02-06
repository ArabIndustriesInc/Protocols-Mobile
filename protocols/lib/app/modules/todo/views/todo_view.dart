import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/todo/controllers/todo_controller.dart';
import 'package:protocols/app/modules/todo/views/todo_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({Key? key}) : super(key: key);
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
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Todo',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Obx(
                () => (Get.find<TodoController>().loading.value)
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: const Center(child: CircularProgressIndicator()))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return (Get.find<TodoController>()
                                    .todoDetails
                                    .isEmpty)
                                ? const EmptyDashMessage(title: 'No Tasks!')
                                : TodoCardView(index: index);
                          },
                          itemCount: (Get.find<TodoController>()
                                  .todoDetails
                                  .isEmpty)
                              ? 1
                              : Get.find<TodoController>().todoDetails.length,
                        ),
                      ),
              )
            ],
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(right: 10, bottom: 10),
          child: ToDoButtonView(),
        ));
  }
}
