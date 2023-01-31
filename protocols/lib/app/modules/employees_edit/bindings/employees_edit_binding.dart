import 'package:get/get.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_date_controller.dart';

class EmployeesEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeesEditDateController>(
      () => EmployeesEditDateController(),
    );
    Get.lazyPut<EmployeesEditController>(
      () => EmployeesEditController(),
    );
  }
}
