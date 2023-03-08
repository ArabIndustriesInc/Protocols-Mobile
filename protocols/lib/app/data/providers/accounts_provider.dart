// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/accounts_model.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/routes/app_pages.dart';

class AccountsModelProvider extends GetConnect {
  static var isFinishedAccounts = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return AccountsModel.fromJson(map);
      if (map is List) {
        return map.map((item) => AccountsModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}bank/';
  }

  getAllAccounts(BuildContext context) async {
    isFinishedAccounts = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}bank/show',
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        isClosedFunctionLoading(false);
        AccountsModel accounts = accountsFromJson(response.bodyString!);
        isClosedList(accounts.data);
      } else if (response.statusCode == 400) {
        var data = jsonDecode(response.bodyString!);
        if (data['payment'] == false) {
          Get.back();
          Get.toNamed(Routes.UPGRADE_PLAN);
        }
      } else {
        isClosedFunctionLoading(false);
        isClosedList([]);
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading(false);
      isClosedList([]);
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Try again later', context));
    }
  }

  Future<String> getBranch(String ifsc) async {
    final response = await http.get(
        Uri.parse('https://bank-apis.justinclicks.com/API/V1/IFSC/$ifsc/'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      final branch = data["BRANCH"];
      return branch;
    } else {
      return 'Nil';
    }
  }

  postAccount(AddAccounts accounts, BuildContext context) async {
    isFinishedAccounts = false;
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}bank/add'), body: {
        'bankname': accounts.bankname,
        'Nickname': accounts.nickname,
        'accountname': accounts.accountname,
        'ifsc': accounts.ifsc,
        'accountnumber': accounts.accountnumber,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        getAllAccounts(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New account added successfully!', context));
      } else {
        log('failed');
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    isFinishedAccounts = true;
    super.onClose();
  }

  isClosedList(List<Accounts> accountsList) {
    if (isFinishedAccounts == false) {
      Get.find<AccountsController>().accounts = accountsList;
      Get.find<AccountsController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedAccounts == false) {
      message;
    }
  }

  isClosedFunctionLoading(bool value) {
    if (isFinishedAccounts == false) {
      Get.find<AccountsController>().loading.value = value;
      // log('isFinishedAccounts:${isFinishedAccounts.toString()}');
    }
  }
}
