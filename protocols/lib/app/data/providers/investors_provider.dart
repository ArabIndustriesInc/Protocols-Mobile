// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/investors_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/investors/controllers/investors_controller.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/modules/investors_add/controllers/investors_add_controller.dart';
import 'package:protocols/app/modules/investors_edit/controllers/investors_edit_controller.dart';

class InvestorsProvider extends GetConnect {
  static var isFinishedInvestors = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Investors.fromJson(map);
      if (map is List) {
        return map.map((item) => Investors.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  getAllInvestors(BuildContext context) async {
    isFinishedInvestors = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}investor/show',
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        InvestorsModel investors = investorsModelFromJson(response.bodyString!);
        isClosedList(investors.data);
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

  addInvestor(
      AddInvestors investor, String filename, BuildContext context) async {
    isFinishedInvestors = false;
    try {
      final token = box.read('login_token');
      var request =
          http.MultipartRequest('POST', Uri.parse('${baseUrlApi}investor/add'));
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'contentType': 'application/json; charset=utf-8'
      };
      request.headers.addAll(headers);
      request.fields.addAll({
        'firstname': investor.firstname,
        'lastname': investor.lastname,
        'middlename': investor.middlename,
        'email': investor.email,
        'mobile': investor.mobile,
        'dob': investor.dob,
        'pannumber': investor.pannumber,
        'address': investor.address,
        'fathersname': investor.fathersname,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', investor.image.path,
          filename: filename));
      var response = await request.send();
      var dataReturn = jsonDecode(response.toString());
      if (response.statusCode == 200) {
        getAllInvestors(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Investor added successfully!', context));
      } else {
        isClosedFunctionLoading('loadingAdd');
        isErrorMessage(dataReturn['message']);
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingAdd');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong, Try again later', context));
    }
  }

  editInvestor(AddInvestors investor, String filename, String id,
      BuildContext context) async {
    isFinishedInvestors = false;
    try {
      final token = box.read('login_token');
      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrlApi}investor/editinvestor/$id'));
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      request.headers.addAll(headers);
      request.fields.addAll({
        'firstname': investor.firstname,
        'lastname': investor.lastname,
        'middlename': investor.middlename,
        'email': investor.email,
        'mobile': investor.mobile,
        'dob': investor.dob,
        'pannumber': investor.pannumber,
        'address': investor.address,
        'fathersname': investor.fathersname,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', investor.image.path,
          filename: filename));
      var response = await request.send().whenComplete(() => deleteImgFile());
      if (response.statusCode == 200) {
        getAllInvestors(context);
        Get.back();
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Investor edited successfully!', context));
      } else {
        isClosedFunctionLoading('loadingEdit');
        isClosedMessage(SnackbarMessage().snackBarMessage(
            'Oops! Action failed, Please try again!', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingEdit');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! something went wrong, Try again later!', context));
    }
  }

  deleteInvestor(String id, BuildContext context) async {
    Get.find<InvestorsController>().loadingDelete.value = true;
    isFinishedInvestors = false;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}investor/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllInvestors(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Investor deleted successfully!', context));
        isClosedFunctionLoading('loadingDelete');
      } else {
        isClosedFunctionLoading('loadingDelete');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingDelete');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went wrong, Try again later', context));
    }
  }

  @override
  void onClose() {
    isFinishedInvestors = true;
    super.onClose();
  }

  deleteImgFile() {
    if (isFinishedInvestors == false) {
      File(Get.find<InvestorsEditController>().deleteFile!).delete();
    }
  }

  isClosedList(List<Investors> investors) {
    if (isFinishedInvestors == false) {
      Get.find<InvestorsController>().investors.value = investors;
      Get.find<InvestorsController>().update();
    }
  }

  isErrorMessage(String message) {
    if (isFinishedInvestors == false) {
      Get.find<InvestorsAddController>().warningMessage(message);
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedInvestors == false) {
      message;
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedInvestors == false) {
      switch (name) {
        case 'loading':
          Get.find<InvestorsController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<InvestorsAddController>().loadingAdd.value = false;
          break;
        case 'loadingEdit':
          Get.find<InvestorsEditController>().loadingEdit.value = false;
          break;
        case 'loadingDelete':
          Get.find<InvestorsController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
// Dio dio = Dio();
//       dio.options.headers['Accept'] = 'application/json; charset=utf-8';
//       print('${Api.BASE_URL}${Api.DEALER_VISIT_PUNCH_OFFLINE}');
//       var response = await dio.post(
//         '${Api.BASE_URL}${Api.DEALER_VISIT_PUNCH_OFFLINE}',
//         data: formData,
//         options: Options(
          // followRedirects: false,
          // validateStatus: (status) {
          //   return status! < 500;
          // },
//         ),
//       );
//       print("resp:-${response.data}");
//       return response;
//     } catch (e) {
//       print(e);
//       print("Exception");
//       return 500;
//     }      // dio.FormData data = dio.FormData.fromMap({
      //   'firstname': investor.firstname,
      //   'lastname': investor.lastname,
      //   'middlename': investor.middlename,
      //   'email': investor.email,
      //   'mobile': investor.mobile,
      //   'dob': investor.dob,
      //   'pannumber': investor.pannumber,
      //   'address': investor.address,
      //   'fathersname': investor.fathersname,
      //   'image': await dio.MultipartFile.fromFile(investor.image.path,
      //       filename: filename)
      // });
      // var response = await dio.Dio().post(
      //     '${baseUrlApi}investor/editinvestor/$id',
      //     data: data,
      //     options: dio.Options(
      //         headers: {'Authorization': 'Bearer $token'},
      //         contentType: 'application/json; charset=utf-8'));
      // var dataReturn = jsonDecode(response.toString());