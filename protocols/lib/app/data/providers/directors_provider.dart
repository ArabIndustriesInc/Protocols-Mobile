// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/directors_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';
import 'package:protocols/app/modules/directors_add/controllers/directors_add_controller.dart';
import 'package:protocols/app/modules/directors_edit/controllers/directors_edit_controller.dart';

class DirectorsProvider extends GetConnect {
  static var isFinishedDirectors = false;
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

  getAllDirectors(BuildContext context) async {
    isFinishedDirectors = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}director/show',
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        DirectorsModel directors = directorsModelFromJson(response.bodyString!);
        isClosedList(directors.data!);
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

  addDirector(
      AddDirectors director, String filename, BuildContext context) async {
    isFinishedDirectors = false;
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
      if (response.statusCode == 200) {
        getAllDirectors(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Director added successfully!', context));
      } else {
        isClosedFunctionLoading('loadingAdd');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingAdd');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong, Try again later', context));
    }
  }

  editDirector(AddDirectors director, String filename, String id,
      BuildContext context) async {
    isFinishedDirectors = false;
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
      var response = await request.send().whenComplete(() => deleteImgFile());
      if (response.statusCode == 200) {
        getAllDirectors(context);
        Get.back();
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Director edited successfully!', context));
      } else {
        isClosedFunctionLoading('loadingEdit');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingEdit');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong, Try again later', context));
    }
  }

  deleteDirector(String id, BuildContext context) async {
    isFinishedDirectors = false;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}director/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loadingDelete');
        getAllDirectors(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Director deleted successfully!', context));
        isClosedFunctionLoading('loadingDelete');
      } else {
        isClosedFunctionLoading('loadingDelete');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingDelete');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  deleteImgFile() {
    if (isFinishedDirectors == false) {
      File(Get.find<DirectorsEditController>().deleteFile!).delete();
    }
  }

  @override
  void onClose() {
    isFinishedDirectors = true;
    super.onClose();
  }

  isClosedList(List<Directors> directors) {
    if (isFinishedDirectors == false) {
      Get.find<DirectorsController>().directors.value = directors;
      Get.find<DirectorsController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedDirectors == false) {
      message;
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedDirectors == false) {
      switch (name) {
        case 'loading':
          Get.find<DirectorsController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<DirectorsAddController>().loadingAdd.value = false;
          break;
        case 'loadingDelete':
          Get.find<DirectorsController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
