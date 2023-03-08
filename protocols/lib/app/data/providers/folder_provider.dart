// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/folder_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/documents/controllers/documents_controller.dart';
import 'package:protocols/app/routes/app_pages.dart';

class FolderProvider extends GetConnect {
  static var isFinishedDocuments = false;
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

  getAllFolders(BuildContext context) async {
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}folder/show',
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        FoldersModel folder = foldersModelFromJson(response.bodyString!);
        isClosedList(folder.data);
      } else if (response.statusCode == 400) {
        var data = jsonDecode(response.bodyString!);
        if (data['payment'] == false) {
          Get.back();
          Get.toNamed(Routes.UPGRADE_PLAN);
        }
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
        getAllFolders(context);

        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Folder added successfully!', context));
        isClosedFunctionLoading('loadingAdd');
      } else {
        isClosedFunctionLoading('loadingAdd');
        var data = jsonDecode(response.body.toString());
        if (data['message'] != 'Payment is not done') {
          isClosedFunctionLoading('loadingAdd');
          errorReturn(data['message'].toString());
        } else {
          isClosedFunctionLoading('loadingAdd');
          isClosedMessage(SnackbarMessage().snackBarMessage(
              'Oops! Action failed, Please try again', context));
        }
      }
    } catch (e) {
      isClosedFunctionLoading('loadingAdd');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context));
    }
  }

  deleteFoldersModel(String id, BuildContext context) async {
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}folder/deletefolder/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllFolders(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Folder deleted successfully!', context));
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

  @override
  void onClose() {
    isFinishedDocuments = true;
    super.onClose();
  }

  errorReturn(String message) {
    if (isFinishedDocuments == false) {
      Get.find<DocumentsController>().visibleOff(message);
    }
  }

  isClosedList(List<Folders> folders) {
    if (isFinishedDocuments == false) {
      Get.find<DocumentsController>().folders = folders;
      Get.find<DocumentsController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedDocuments == false) {
      message;
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedDocuments == false) {
      switch (name) {
        case 'loading':
          Get.find<DocumentsController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<DocumentsController>().loadingAdd.value = false;
          break;
        case 'loadingDelete':
          Get.find<DocumentsController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
