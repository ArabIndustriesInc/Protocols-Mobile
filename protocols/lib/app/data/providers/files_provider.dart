// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_file/internet_file.dart';
import 'package:internet_file/storage_io.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/files_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/docs_folder/controllers/folder_controller.dart';

class FilesProvider extends GetConnect {
  static var isFinishedFolder = false;
  static var isFinishedFolderDownloading = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Files.fromJson(map);
      if (map is List) return map.map((item) => Files.fromJson(item)).toList();
    };
    httpClient.baseUrl = '${baseUrlApi}folder/';
  }

  getAllFiles(String id, BuildContext context) async {
    isFinishedFolder = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}folder/showfolder/$id',
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        FilesModel files = filesModelFromJson(response.bodyString!);
        getStorage();
        isClosedList(files.data);
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

  getStorage() async {
    if (isFinishedFolder == false) {
      final appStorage = await Get.find<FolderController>().getStorage();
      box.write('storage', appStorage);
    }
  }

  Future<File> downloadFile(
      String filename, String networkFile, int index) async {
    isFinishedFolderDownloading = true;
    // final token = box.read('login_token');
    // http.Client client = http.Client();
    final dir = Get.find<FolderController>().appStorage!.path;
    File file = File('$dir/$filename');
    final storageIO = InternetFileStorageIO();
    Get.find<FolderController>().fileIndex.value = index.toString();
    await InternetFile.get(
      networkFile,
      storage: storageIO,
      storageAdditional: storageIO.additional(
        filename: filename,
        location: '$dir/',
      ),
      force: true,
      progress: (receivedLength, contentLength) {
        final percentage = receivedLength / contentLength * 100;
        Get.find<FolderController>().percentage.value = percentage;
        if (percentage == 100) {
          Get.find<FolderController>().fileIndex.value = '-1';
          Get.find<FolderController>().percentage.value = 0.0;
        }
      },
    );
    isFinishedFolderDownloading = false;
    return file;
    // var response = await Dio().download(
    //   image,
    //   file,
    //   options: Options(
    //     headers: {'Authorization': 'Bearer $token'},
    //     contentType: 'application/json; charset=utf-8',
    //     responseType: ResponseType.bytes,
    //     followRedirects: false,
    //     receiveTimeout: 0,
    //   ),
    // );
    // log(response.data);
    // final raf = file.openSync(mode: FileMode.write);
    // raf.writeByteSync(response.data);
    // await raf.close();
    // if (response.statusCode == 200) {
    // } else {
    //   return File('null');
    // }
  }

  addFile(AddFiles file, BuildContext context) async {
    isFinishedFolder = false;
    try {
      final token = box.read('login_token');
      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrlApi}folder/adddata/${file.folderid}'));
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      request.headers.addAll(headers);
      request.fields.addAll({
        'filename': file.filename,
        'folderid': file.folderid,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', file.image.path,
          filename: file.filename));
      var response = await request.send();
      log(response.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.find<FolderController>().loadingAdd.value = false;
        getAllFiles(file.folderid, context);
        Get.find<FolderController>().getAllFiles();
        SnackbarMessage()
            .snackBarMessage('New File added successfully!', context);
      } else {
        Get.find<FolderController>().loadingAdd.value = false;
        SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context);
      }
    } catch (e) {
      Get.find<FolderController>().loadingAdd.value = false;
      log(e.toString());
      SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context);
    }
  }

  deleteFile(String fileid, String id, BuildContext context) async {
    isFinishedFolder = false;
    Get.find<FolderController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}folder/deletefile/$fileid'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllFiles(id, context);
        Get.back();
        Get.find<FolderController>().getAllFiles();
        SnackbarMessage()
            .snackBarMessage('File deleted successfully!', context);
        Get.find<FolderController>().loadingDelete.value = false;
      } else {
        log(response.statusCode.toString());
        log(response.body);
        SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context);
      }
    } catch (e) {
      SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context);
    }
  }

  @override
  void onClose() {
    isFinishedFolder = true;
    super.onClose();
  }

  // errorReturn(String message) {
  //   if (isFinishedFolder == false) {
  //     Get.find<FolderController>().visibleOff(message);
  //   }
  // }

  isClosedList(List<Files> files) {
    if (isFinishedFolder == false) {
      Get.find<FolderController>().files.value = files;
      Get.find<FolderController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedFolder == false) {
      message;
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedFolder == false) {
      switch (name) {
        case 'loading':
          Get.find<FolderController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<FolderController>().loadingAdd.value = false;
          break;
        case 'loadingDelete':
          Get.find<FolderController>().loadingDelete.value = false;
          break;
      }
    }
  }
}





  // Future<File> downloadFile(String filename, String image) async {
  //   final token = box.read('login_token');
  //   final dir = Get.find<FolderController>().appStorage.path;
  //   File file = File('$dir/$filename');
  //   var response = await Dio()
  //       .get(image,options:Options (headers: {'Authorization': 'Bearer $token'}, ));
  //   var bytes = req.bodyBytes;
  //   await file.writeAsBytes(bytes);
  //   return file;
  // }
  


  // var request = http.MultipartRequest(
      //     'POST', Uri.parse('${baseUrlApi}folder/adddata/${file.folderid}'));
      // request.headers.addAll({'Authorization': 'Bearer $token'});
      // request.files.add(await http.MultipartFile.fromPath(
      //     '${baseUrlApi}folder/adddata/${file.folderid}', file.image.path));
      // var response = await request.send();
     





// Future<File> saveFile(String fi, String image) async {
  //   final token = box.read('login_token');
  //   final appStorage = Get.find<FolderController>().appStorage;
  //   final newFile = File('${appStorage.path}/$file');
  //   var response = await Dio().download(image, '${appStorage.path}/$file',
  //       options: Options(headers: {'Authorization': 'Bearer $token'}));
  //   if (response.statusCode == 200) {
  //     return File(newFile.path);
  //   } else {
  //     return File('null');
  //   }
  // }

