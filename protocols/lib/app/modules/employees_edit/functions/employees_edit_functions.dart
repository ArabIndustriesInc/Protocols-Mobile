import 'package:get/get.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_date_controller.dart';

class EmployeesInitValues {
  final int index;

  EmployeesInitValues({required this.index});
  initValues() {
    Get.find<EmployeesEditController>().initTimes.value++;
    final jd = DateTime.parse(
        Get.find<EmployeesController>().employees[index].joiningdate);
    Get.find<EmployeesEditDateController>().initDateWork(jd);
    final dob =
        DateTime.parse(Get.find<EmployeesController>().employees[index].dob);
    Get.find<EmployeesEditDateController>().initDatePersonal(dob);
    Get.find<EmployeesEditController>().accHolderNameController.text =
        Get.find<EmployeesController>().employees[index].accName;
    Get.find<EmployeesEditController>().accNoController.text =
        Get.find<EmployeesController>().employees[index].accNo;
    Get.find<EmployeesEditController>().accTypeController.text =
        Get.find<EmployeesController>().employees[index].type;
    Get.find<EmployeesEditController>().addressController.text =
        Get.find<EmployeesController>().employees[index].address;
    Get.find<EmployeesEditController>().bankNameController.text =
        Get.find<EmployeesController>().employees[index].bank;
    Get.find<EmployeesEditController>().empIdController.text =
        Get.find<EmployeesController>().employees[index].employeeid;
    Get.find<EmployeesEditController>().esiNoController.text =
        Get.find<EmployeesController>().employees[index].esinumber!;
    Get.find<EmployeesEditController>().fatherNameController.text =
        Get.find<EmployeesController>().employees[index].fathersname;
    Get.find<EmployeesEditController>().firstNameController.text =
        Get.find<EmployeesController>().employees[index].firstname;
    Get.find<EmployeesEditController>().ifscController.text =
        Get.find<EmployeesController>().employees[index].ifsc;
    Get.find<EmployeesEditController>().lastNameController.text =
        Get.find<EmployeesController>().employees[index].lastname;
    Get.find<EmployeesEditController>().mailIdController.text =
        Get.find<EmployeesController>().employees[index].email;
    Get.find<EmployeesEditController>()
        .midNameController
        .text = (Get.find<EmployeesController>().employees[index].middlename ==
                'Nil' ||
            Get.find<EmployeesController>().employees[index].middlename ==
                ' ' ||
            Get.find<EmployeesController>().employees[index].middlename == '' ||
            Get.find<EmployeesController>().employees[index].middlename == '.')
        ? ''
        : Get.find<EmployeesController>().employees[index].middlename!;
    Get.find<EmployeesEditController>().designationController.text =
        Get.find<EmployeesController>().employees[index].position;
    Get.find<EmployeesEditController>().mobNoController.text =
        Get.find<EmployeesController>().employees[index].mobile;
    Get.find<EmployeesEditController>().panNoController.text =
        Get.find<EmployeesController>().employees[index].pannumber;
    Get.find<EmployeesEditController>().payModeController.text =
        Get.find<EmployeesController>().employees[index].paymentMode;
    Get.find<EmployeesEditController>().pfAccNoController.text =
        Get.find<EmployeesController>().employees[index].pfaccountnumber;
    Get.find<EmployeesEditController>().uanNoController.text =
        Get.find<EmployeesController>().employees[index].uannumber;
    Get.find<EmployeesEditController>().workLocController.text =
        Get.find<EmployeesController>().employees[index].worklocation;
  }
}
