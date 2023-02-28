import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/employees_provider.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesController extends GetxController {
  final BuildContext context;
  RxList employees = [].obs;
  var loading = true.obs;
  var loadingDelete = false.obs;

  EmployeesController(this.context);
  getAllEmployees() async {
    await EmployeesProvider().getAllEmployees(context);
    update();
  }

  @override
  void onClose() {
    EmployeesProvider.isFinishedEmployees = true;
    EmployeesProvider().onClose();
    super.onClose();
  }

  @override
  void onInit() async {
    getAllEmployees();
    update();
    super.onInit();
  }
}

class EmployeesButtonView extends GetView {
  const EmployeesButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff1F7DE5), Color(0xff5DCCFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.EMPLOYEES_ADD);
        },
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 32.w,
        ),
      ),
    );
  }
}
