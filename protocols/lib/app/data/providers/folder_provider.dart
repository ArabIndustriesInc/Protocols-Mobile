// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/folder_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/documents/controllers/documents_controller.dart';

class FolderProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return FoldersModel.fromJson(map);
      if (map is List) {
        return map.map((item) => FoldersModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}folder/';
  }

  Future<FoldersModel?> getFolder(int id) async {
    final response = await get('folder/$id');
    return response.body;
  }

  Future<List<Folders>> getAllFolders() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}folder/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<DocumentsController>().loading.value = false;
    FoldersModel folder = foldersModelFromJson(response.bodyString!);
    return folder.data;
  }

  addFolder(AddFolders folder, BuildContext context) async {
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}folder/add'), body: {
        'foldername': folder.foldername,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        getAllFolders();
        Get.find<DocumentsController>().getAllFolders();
        Get.back(
          result: Get.find<DocumentsController>().getAllFolders(),
        );
        SnackbarMessage()
            .snackBarMessage('New Folder added successfully!', context);
        Get.find<DocumentsController>().loadingAdd.value = false;
        Get.find<DocumentsController>().controller.clear();
        Get.find<DocumentsController>().errorIsVisible.value = false;
      } else {
        var data = jsonDecode(response.body.toString());
        if (data['message'] != 'Payment is not done') {
          Get.find<DocumentsController>().loadingAdd.value = false;
          Get.find<DocumentsController>()
              .visibleOff(data['message'].toString());
        } else {
          Get.find<DocumentsController>().loadingAdd.value = false;
          SnackbarMessage().snackBarMessage(
              'Oops! Action failed. Please try again', context);
        }
      }
    } catch (e) {
      Get.find<DocumentsController>().loadingAdd.value = false;
      SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context);
    }
  }

  deleteFoldersModel(String id, BuildContext context) async {
    Get.find<DocumentsController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}folder/deletefolder/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllFolders();
        Get.back();
        Get.find<DocumentsController>().getAllFolders();
        SnackbarMessage()
            .snackBarMessage('Folder deleted successfully!', context);
        Get.find<DocumentsController>().loadingDelete.value = false;
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
