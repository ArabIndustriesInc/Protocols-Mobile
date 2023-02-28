// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/transaction_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:protocols/app/modules/transactions_add/controllers/transactions_add_controller.dart';
import 'package:protocols/app/modules/transactions_edit/controllers/transactions_edit_controller.dart';

class TransactionsProvider extends GetConnect {
  static var isFinishedTransactions = false;
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

  getAllTransactions(BuildContext context) async {
    isFinishedTransactions = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}bank/showtransaction',
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        isClosedFunctionLoading('loading');
        TransactionsModel transactions =
            transactionsFromJson(response.bodyString!);
        isClosedList(transactions.data);
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

  addTransaction(AddTransactions transaction, BuildContext context) async {
    isFinishedTransactions = false;
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
        getAllTransactions(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('New Transaction added successfully!', context));
      } else {
        isClosedFunctionLoading('loadingAdd');
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Oops! Action failed, Please try again', context));
      }
    } catch (e) {
      isClosedFunctionLoading('loadingAdd');
      isClosedMessage(SnackbarMessage().snackBarMessage(
          'Oops! Something went Wrong. Please try again', context));
    }
  }

  editTransaction(
      AddTransactions transaction, BuildContext context, String id) async {
    isFinishedTransactions = false;
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
        getAllTransactions(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Transaction edited successfully!', context));
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

  deleteTransactionsModel(String id, BuildContext context) async {
    isFinishedTransactions = false;
    Get.find<TransactionsController>().loadingDelete.value = true;
    try {
      final token = box.read('login_token');
      final response = await http.post(
          Uri.parse('${baseUrlApi}bank/delete/$id'),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        getAllTransactions(context);
        Get.back();
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Transaction deleted successfully!', context));
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
    isFinishedTransactions = true;
    super.onClose();
  }

  isClosedList(List<Transactions> transactions) {
    if (isFinishedTransactions == false) {
      Get.find<TransactionsController>().transactions = transactions;
      Get.find<TransactionsController>().update();
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedTransactions == false) {
      message;
    }
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedTransactions == false) {
      switch (name) {
        case 'loading':
          Get.find<TransactionsController>().loading.value = false;
          break;
        case 'loadingAdd':
          Get.find<TransactionsAddController>().loadingAdd.value = false;
          break;
        case 'loadingEdit':
          Get.find<TransactionsEditController>().loadingEdit.value = false;
          break;
        case 'loadingDelete':
          Get.find<TransactionsController>().loadingDelete.value = false;
          break;
      }
    }
  }
}
