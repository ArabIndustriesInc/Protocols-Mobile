// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
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
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      log(response.body);
      if (data["paid"] == true) {
        box.write('login_token', data['token']);
        box.write('paid_user', data['paid']);
        Get.offAllNamed(Routes.HOME);
        SnackbarMessage().snackBarMessage('Logged in successfully!', context);
      } else {
        box.write('paid_user', data['paid']);
        box.write('login_token', data['token']);
        Get.toNamed(Routes.PRICING_PLAN);
      }
    } else {
      Get.find<LoginController>().isVisible.value = false;
      Get.find<LoginController>().visibleOff(data['message'].toString());
    }
  } catch (e) {
    Get.find<LoginController>().isVisible.value = false;
    log(e.toString());
    SnackbarMessage().snackBarMessage(
        'Oops something went wrong!, Try again later', context);
  }
}
