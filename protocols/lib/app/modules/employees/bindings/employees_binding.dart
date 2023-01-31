import 'package:get/get.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';

class EmployeesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeesController>(
      () => EmployeesController(),
    );
  }
}
