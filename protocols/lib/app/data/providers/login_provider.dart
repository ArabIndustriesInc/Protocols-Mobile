// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/login/controllers/login_controller.dart';
import 'package:protocols/app/routes/app_pages.dart';

void login(String email, password, BuildContext context) async {
  try {
    final response = await http.post(Uri.parse('${baseUrlApi}login/check'),
        body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      box.write('login_token', data['token']);
      Get.offAllNamed(Routes.HOME);
      SnackbarMessage().snackBarMessage('Logged in successfully!', context);
    } else {
      var data = jsonDecode(response.body.toString());
      if (data['message'] != 'Payment is not done') {
        Get.find<LoginController>().visibleOff(data['message'].toString());
      } else {
        Get.toNamed(Routes.PRICING_PLAN);
      }
    }
  } catch (e) {
    SnackbarMessage()
        .snackBarMessage('Oops something went wrong!, Retry', context);
  }
}
