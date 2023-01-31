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

class AccountsModelProvider extends GetConnect {
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

  Future<List<Accounts>> getAllAccounts() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}bank/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<AccountsController>().loading.value = false;
    log(response.statusCode.toString());
    AccountsModel accounts = accountsFromJson(response.bodyString!);
    return accounts.data;
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
        getAllAccounts();
        Get.find<AccountsController>().getAllAccounts();
        Get.back(
          result: Get.find<AccountsController>().getAllAccounts(),
        );
        SnackbarMessage()
            .snackBarMessage('New account added successfully!', context);
      } else {
        log('failed');
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Response> deleteAccountsModel(int id) async =>
      await delete('accounts/$id');
}
