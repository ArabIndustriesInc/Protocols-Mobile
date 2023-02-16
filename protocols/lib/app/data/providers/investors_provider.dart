// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
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

  Future<List<Investors>?> getAllInvestors() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}investor/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<InvestorsController>().loading.value = false;
    // log(response.bodyString.toString());
    InvestorsModel investors = investorsModelFromJson(response.bodyString!);
    return investors.data;
  }

  addInvestor(
      AddInvestors investor, String filename, BuildContext context) async {
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
      log(response.toString());
      if (response.statusCode == 200) {
        getAllInvestors();
        Get.find<InvestorsController>().getAllInvestors();
        Get.back(
          result: Get.find<InvestorsController>().getAllInvestors(),
        );
        SnackbarMessage()
            .snackBarMessage('New Investor added successfully!', context);
      } else {
        Get.find<InvestorsAddController>().loadingAdd.value = false;
        Get.find<InvestorsAddController>()
            .warningMessage(dataReturn['message']);
        log('failed');
        log(response.statusCode.toString());
      }
    } catch (e) {
      Get.find<InvestorsAddController>().loadingAdd.value = false;
      log(e.toString());
    }
  }

  editInvestor(AddInvestors investor, String filename, String id,
      BuildContext context) async {
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
      var response = await request.send().whenComplete(() =>
          Get.find<InvestorsEditController>().dir!.deleteSync(recursive: true));
      if (response.statusCode == 200) {
        getAllInvestors();
        Get.find<InvestorsController>().getAllInvestors();
        Get.back(
          result: Get.find<InvestorsController>().getAllInvestors(),
        );
        SnackbarMessage()
            .snackBarMessage('New Investor edited successfully!', context);
      } else {
        log('failed');
        Get.find<InvestorsEditController>().loadingEdit.value = false;
        log(response.statusCode.toString());
        SnackbarMessage()
            .snackBarMessage('Oops action failed! Please try again!', context);
      }
    } catch (e) {
      Get.find<InvestorsEditController>().loadingEdit.value = false;
      log(e.toString());
      SnackbarMessage().snackBarMessage(
          'Oops something went wrong! Try again later!', context);
    }
  }

  deleteInvestor(String id, BuildContext context) async {
    Get.find<InvestorsController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}investor/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllInvestors();
        Get.back();
        Get.find<InvestorsController>().getAllInvestors();
        SnackbarMessage()
            .snackBarMessage('Investor deleted successfully!', context);
        Get.find<InvestorsController>().loadingDelete.value = false;
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
      // // var dataReturn = jsonDecode(response.toString());