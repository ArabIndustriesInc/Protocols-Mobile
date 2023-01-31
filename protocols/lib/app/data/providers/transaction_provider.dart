// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/transaction_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/transactions/controllers/transactions_controller.dart';

class TransactionsModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return TransactionsModel.fromJson(map);
      if (map is List) {
        return map.map((item) => TransactionsModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}bank';
  }

  Future<TransactionsModel?> getTransactionsModel(int id) async {
    final response = await get('transaction/$id');
    return response.body;
  }

  Future<List<Transactions>> getAllTransactions() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}bank/showtransaction',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<TransactionsController>().loading.value = false;
    TransactionsModel transactions = transactionsFromJson(response.bodyString!);
    return transactions.data;
  }

  // Future<TransactionsModel?> getAllTransactions() async {
  //   final response = await get('${baseUrlApi}bank/showtransaction');
  //   return response.body;
  // }
  addTransaction(AddTransactions transaction, BuildContext context) async {
    try {
      final token = box.read('login_token');
      final response =
          await http.post(Uri.parse('${baseUrlApi}bank/addtransaction'), body: {
        'title': transaction.title,
        'description': transaction.description,
        'amount': transaction.amount,
        'type': transaction.type,
        'selecttime': transaction.selecttime,
        'selectdate': transaction.selectdate,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        getAllTransactions();
        Get.find<TransactionsController>().getAllTransactions();
        Get.back(
          result: Get.find<TransactionsController>().getAllTransactions(),
        );
        SnackbarMessage()
            .snackBarMessage('New Transaction added successfully!', context);
      } else {
        SnackbarMessage()
            .snackBarMessage('Oops! Action failed. Please try again', context);
      }
    } catch (e) {
      SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context);
    }
  }

  editTransaction(
      AddTransactions transaction, BuildContext context, String id) async {
    try {
      final token = box.read('login_token');
      final response = await http
          .post(Uri.parse('${baseUrlApi}bank/edittransaction/$id'), body: {
        'title': transaction.title,
        'description': transaction.description,
        'amount': transaction.amount,
        'type': transaction.type,
        'selecttime': transaction.selecttime,
        'selectdate': transaction.selectdate,
      }, headers: {
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        getAllTransactions();
        Get.back(
          result: Get.find<TransactionsController>().getAllTransactions(),
        );
        Get.find<TransactionsController>().getAllTransactions();

        SnackbarMessage()
            .snackBarMessage('Transaction edited successfully!', context);
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

  deleteTransactionsModel(String id, BuildContext context) async {
    Get.find<TransactionsController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}bank/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllTransactions();
        Get.back();
        Get.find<TransactionsController>().getAllTransactions();
        SnackbarMessage()
            .snackBarMessage('Transaction deleted successfully!', context);
        Get.find<TransactionsController>().loadingDelete.value = false;
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
