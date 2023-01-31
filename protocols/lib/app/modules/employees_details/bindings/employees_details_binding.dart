import 'package:get/get.dart';
import 'package:protocols/app/modules/employees_details/controllers/employees_details_controller.dart';

class EmployeesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeesDetailsController>(
      () => EmployeesDetailsController(),
    );
  }
}
