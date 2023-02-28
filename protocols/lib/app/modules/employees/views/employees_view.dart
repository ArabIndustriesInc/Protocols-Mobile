import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees/views/employee_card_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesView extends GetView<EmployeesController> {
  const EmployeesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom().appBar(context),
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
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Text(
                  'Employees',
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
                () => (Get.find<EmployeesController>().loading.value)
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: const Center(child: CircularProgressIndicator()))
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return (Get.find<EmployeesController>()
                                    .employees
                                    .isEmpty)
                                ? const EmptyDashMessage(title: 'No Employees!')
                                : EmployeeCardView(index: index);
                          },
                          itemCount: (Get.find<EmployeesController>()
                                  .employees
                                  .isEmpty)
                              ? 1
                              : Get.find<EmployeesController>()
                                  .employees
                                  .length,
                          separatorBuilder: (BuildContext context, index) {
                            return const SizedBox(
                              height: 30,
                            );
                          },
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(right: 10, bottom: 10),
          child: EmployeesButtonView(),
        ));
  }
}
