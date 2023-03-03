// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/employees_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/employees/controllers/employees_controller.dart';
import 'package:protocols/app/modules/employees_add/controllers/employees_add_controller.dart';
import 'package:protocols/app/modules/employees_edit/controllers/employees_edit_controller.dart';

class EmployeesProvider extends GetConnect {
  static var isFinishedEmployees = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Employees.fromJson(map);
      if (map is List) {
        return map.map((item) => Employees.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}employee';
  }

  getAllEmployees(BuildContext context) async {
    isFinishedEmployees = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}employee/show',
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        EmployeesModel employees = employeesModelFromJson(response.bodyString!);
        isClosedList(employees.data);
      } else {
        isClosedFunctionLoading('loading');
        isClosedList([]);
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loading');
      isClosedList([]);
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  addEmployee(
      AddEmployees employee, String filename, BuildContext context) async {
    isFinishedEmployees = false;
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
      http.Response response =
          await http.Response.fromStream(await request.send());
      var dataReturn = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        isClosedFunctionLoading('loadingAdd');
        getAllEmployees(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Employee added successfully!', context));
      } else if (response.statusCode == 400) {
        isClosedFunctionLoading('loadingAdd');
        isErrorMessage(dataReturn['message']);
        isClosedMessage(SnackbarMessage().snackBarMessage(
            'Oops! ${dataReturn['message'].toString()}, Please check again',
            context));
      } else {
        isClosedFunctionLoading('loadingAdd');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong, Try again later', context));
      isClosedFunctionLoading('loadingAdd');
    }
  }

  editEmployee(String id, AddEmployees employee, String filename,
      BuildContext context) async {
    isFinishedEmployees = false;
    try {
      final token = box.read('login_token');
      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrlApi}employee/editemployee/$id'));
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
      http.Response response =
          await http.Response.fromStream(await request.send())
              .whenComplete(() => deleteImgFile());

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loadingEdit');
        getAllEmployees(context);
        Get.back();
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Employee edited successfully!', context));
      } else {
        isClosedFunctionLoading('loadingEdit');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong, Try again later', context));

      isClosedFunctionLoading('loadingEdit');
    }
  }

  deleteEmployee(String id, BuildContext context) async {
    isFinishedEmployees = false;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}employee/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllEmployees(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Employee deleted successfully!', context));
        isClosedFunctionLoading('loadinDelete');
      } else {
        isClosedFunctionLoading('loadinDelete');
        isClosedMessage((SnackbarMessage().snackBarMessage(
            'Oops! Action failed, Please try again', context)));
      }
    } catch (e) {
      isClosedFunctionLoading('loadinDelete');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  @override
  void onClose() {
    isFinishedEmployees = true;
    super.onClose();
  }

  deleteImgFile() {
    if (isFinishedEmployees == false) {
      File(Get.find<EmployeesEditController>().deleteFile!).delete();
    }
  }

  isClosedList(List<Employees> employees) {
    if (isFinishedEmployees == false) {
      Get.find<EmployeesController>().employees.value = employees;
      Get.find<EmployeesController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedEmployees == false) {
      message;
    }
  }

  isErrorMessage(String message) {
    if (isFinishedEmployees == false) {
      Get.find<EmployeesAddController>().warningMessage(message);
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedEmployees == false) {
      switch (name) {
        case 'loading':
          Get.find<EmployeesController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<EmployeesAddController>().loadingAdd.value = false;
          break;
        case 'loadingEdit':
          Get.find<EmployeesEditController>().loadingEdit.value = false;
          break;
        case 'loadingDelete':
          Get.find<EmployeesController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
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