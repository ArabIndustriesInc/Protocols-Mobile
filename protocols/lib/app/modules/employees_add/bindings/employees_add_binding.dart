import 'package:get/get.dart';
import 'package:protocols/app/modules/employees_add/controllers/employee_add_date_controller.dart';
import 'package:protocols/app/modules/employees_add/controllers/employees_add_controller.dart';

class EmployeesAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeAddDateController>(
      () => EmployeeAddDateController(),
    );
    Get.lazyPut<EmployeesAddController>(
      () => EmployeesAddController(),
    );
  }
}
