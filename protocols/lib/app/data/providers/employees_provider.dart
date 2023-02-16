// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/employees_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_add/controllers/employees_add_controller.dart';

class EmployeesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Employees.fromJson(map);
      if (map is List) {
        return map.map((item) => Employees.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Employees>> getAllEmployees() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}employee/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<EmployeesController>().loading.value = false;
    log(response.bodyString.toString());
    EmployeesModel employees = employeesModelFromJson(response.bodyString!);
    return employees.data;
  }

  addEmployee(
      AddEmployees employee, String filename, BuildContext context) async {
    try {
      final token = box.read('login_token');
      var request =
          http.MultipartRequest('POST', Uri.parse('${baseUrlApi}employee/add'));
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      request.headers.addAll(headers);
      request.fields.addAll({
        'firstname': employee.firstname,
        'lastname': employee.lastname,
        'middlename': employee.middlename!,
        'email': employee.email,
        'mobile': employee.mobile,
        'dob': employee.dob,
        'pannumber': employee.pannumber,
        'address': employee.address,
        'fathersname': employee.fathersname,
        'joiningdate': employee.joiningdate,
        'employeeid': employee.employeeid,
        'pfaccountnumber': employee.pfaccountnumber,
        'worklocation': employee.worklocation,
        'uannumber': employee.uannumber,
        'paymentMode': employee.paymentMode,
        'bank': employee.bank,
        'type': employee.type,
        'ifsc': employee.ifsc,
        'accName': employee.accName,
        'accNo': employee.accNo,
        'position': employee.position,
        'esinumber': employee.esinumber!,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', employee.image.path,
          filename: filename));
      var response = await request.send();
      // dio.FormData data = dio.FormData.fromMap({
      //   'firstname': employee.firstname,
      //   'lastname': employee.lastname,
      //   'middlename': employee.middlename,
      //   'email': employee.email,
      //   'mobile': employee.mobile,
      //   'dob': employee.dob,
      //   'pannumber': employee.pannumber,
      //   'address': employee.address,
      //   'fathersname': employee.fathersname,
      //   'image': await dio.MultipartFile.fromFile(employee.image.path,
      //       filename: filename)
      // });
      // var response = await dio.Dio().post('${baseUrlApi}employee/add',
      //     data: data,
      //     options: dio.Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        getAllEmployees();
        Get.find<EmployeesController>().getAllEmployees();
        Get.back(
          result: Get.find<EmployeesController>().getAllEmployees(),
        );
        SnackbarMessage()
            .snackBarMessage('New Employee added successfully!', context);
      } else {
        Get.find<EmployeesAddController>().loadingAdd.value = false;
        log('failed');
        SnackbarMessage()
            .snackBarMessage('Oops! Something went wrong, Try again', context);
        log(response.statusCode.toString());
        log(response.toString());
      }
    } catch (e) {
      log(e.toString());
      Get.find<EmployeesAddController>().loadingAdd.value = false;
    }
  }
}
