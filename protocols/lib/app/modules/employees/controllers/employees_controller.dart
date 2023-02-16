import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/providers/employees_provider.dart';
import 'package:protocols/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeesController extends GetxController {
  List<EmployeeModel> employeeList = [];
  add(EmployeeModel employee) {
    employeeList.add(employee);
    update();
  }

  RxList employees = [].obs;
  var loading = true.obs;
  var loadingDelete = false.obs;
  getAllEmployees() async {
    employees.value = (await EmployeesProvider()
        .getAllEmployees()
        .whenComplete(() => loading.value = false));
    update();
  }

  @override
  void onInit() async {
    getAllEmployees();
    update();
    super.onInit();
  }
}

class EmployeeModel {
  final String fName;
  final String designation;
  final String empID;
  final String joiningDate;
  final String location;
  final String dob;
  final String fatherName;
  final String address;
  final String emailID;
  final String mobNo;
  final String panNo;
  final String payment;
  final String accHolder;
  final String bankName;
  final String accNo;
  final String accType;
  final String ifsc;
  String? mName;
  String? lName;
  String? pfAcNo;
  String? uanNo;
  String? esiNo;
  String? image;
  EmployeeModel(
    this.image,
    this.pfAcNo,
    this.mName,
    this.lName,
    this.uanNo,
    this.esiNo, {
    required this.fName,
    required this.designation,
    required this.empID,
    required this.fatherName,
    required this.address,
    required this.emailID,
    required this.joiningDate,
    required this.location,
    required this.dob,
    required this.mobNo,
    required this.panNo,
    required this.payment,
    required this.accHolder,
    required this.bankName,
    required this.accNo,
    required this.accType,
    required this.ifsc,
  });
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
