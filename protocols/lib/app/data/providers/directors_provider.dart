// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/directors_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_controller.dart';

class DirectorsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Directors.fromJson(map);
      if (map is List) {
        return map.map((item) => Directors.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}director/';
  }

  Future<List<Directors>?> getAllDirectors() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}director/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<DirectorsController>().loading.value = false;
    log(response.bodyString.toString());
    DirectorsModel directors = directorsModelFromJson(response.bodyString!);
    return directors.data;
  }

  addDirector(
      AddDirectors director, String filename, BuildContext context) async {
    try {
      final token = box.read('login_token');
      var request =
          http.MultipartRequest('POST', Uri.parse('${baseUrlApi}director/add'));
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      request.headers.addAll(headers);
      request.fields.addAll({
        'firstname': director.firstname,
        'lastname': director.lastname,
        'middlename': director.middlename!,
        'email': director.email,
        'mobile': director.mobile,
        'dob': director.dob,
        'pannumber': director.pannumber,
        'address': director.address,
        'fathersname': director.fathersname,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', director.image.path,
          filename: filename));
      var response = await request.send();
      // dio.FormData data = dio.FormData.fromMap({
      //   'firstname': director.firstname,
      //   'lastname': director.lastname,
      //   'middlename': director.middlename,
      //   'email': director.email,
      //   'mobile': director.mobile,
      //   'dob': director.dob,
      //   'pannumber': director.pannumber,
      //   'address': director.address,
      //   'fathersname': director.fathersname,
      //   'image': await dio.MultipartFile.fromFile(director.image.path,
      //       filename: filename)
      // });
      // var response = await dio.Dio().post('${baseUrlApi}director/add',
      //     data: data,
      //     options: dio.Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        getAllDirectors();
        Get.find<DirectorsController>().getAllDirectors();
        Get.back(
          result: Get.find<DirectorsController>().getAllDirectors(),
        );
        SnackbarMessage()
            .snackBarMessage('New Director added successfully!', context);
      } else {
        Get.find<DirectorsAddController>().loadingAdd.value = false;
        log('failed');
        SnackbarMessage()
            .snackBarMessage('Oops! Something went wrong, Try again', context);
        log(response.statusCode.toString());
        log(response.toString());
      }
    } catch (e) {
      log(e.toString());
      Get.find<DirectorsAddController>().loadingAdd.value = false;
    }
  }

  editDirector(AddDirectors director, String filename, String id,
      BuildContext context) async {
    try {
      final token = box.read('login_token');

      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrlApi}director/editdirector/$id'));
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      request.headers.addAll(headers);
      request.fields.addAll({
        'firstname': director.firstname,
        'lastname': director.lastname,
        'middlename': director.middlename!,
        'email': director.email,
        'mobile': director.mobile,
        'dob': director.dob,
        'pannumber': director.pannumber,
        'address': director.address,
        'fathersname': director.fathersname,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', director.image.path,
          filename: filename));
      var response = await request.send();
      // dio.FormData data = dio.FormData.fromMap({
      //   'firstname': director.firstname,
      //   'lastname': director.lastname,
      //   'middlename': director.middlename,
      //   'email': director.email,
      //   'mobile': director.mobile,
      //   'dob': director.dob,
      //   'pannumber': director.pannumber,
      //   'address': director.address,
      //   'fathersname': director.fathersname,
      //   'image': await dio.MultipartFile.fromFile(director.image.path,
      //       filename: filename)
      // });
      // var response = await dio.Dio().post(
      //     '${baseUrlApi}director/editdirector/$id',
      //     data: data,
      //     options: dio.Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        getAllDirectors();
        Get.find<DirectorsController>().getAllDirectors();
        Get.back(
          result: Get.find<DirectorsController>().getAllDirectors(),
        );
        SnackbarMessage()
            .snackBarMessage('Director edited successfully!', context);
      } else {
        log('failed');
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  deleteDirector(String id, BuildContext context) async {
    Get.find<DirectorsController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}director/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllDirectors();
        Get.back();
        Get.find<DirectorsController>().getAllDirectors();
        SnackbarMessage()
            .snackBarMessage('Director deleted successfully!', context);
        Get.find<DirectorsController>().loadingDelete.value = false;
      } else {
        log(response.statusCode.toString());
        log(response.body);
        SnackbarMessage()
            .snackBarMessage('Oops! Action failed. Please try again', context);
      }
    } catch (e) {
      SnackbarMessage().snackBarMessage('Oops! $e. Please try again', context);
    }
  }
}
