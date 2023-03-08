// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/login/controllers/login_controller.dart';
import 'package:protocols/app/modules/login/controllers/login_field_controller.dart';
import 'package:protocols/app/routes/app_pages.dart';

class LoginProvider {
  static int? role;
  void login(String email, password, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse('${baseUrlApi}login/check'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        box.write('company_role', data["role"]);
        box.write('login_token', data['token']);
        role = int.parse(data["role"]);
        box.write('paid_user', data['paid']);
        SnackbarMessage().snackBarMessage('Logged in successfully!', context);
        Get.offAllNamed(Routes.HOME);
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        var data = jsonDecode(response.body.toString());
        Get.find<LoginController>().isVisible.value = false;
        Get.find<LoginController>().visibleOff(data['message'].toString());
      } else {
        SnackbarMessage().snackBarMessage(
            'Oops! Action Failed, Please check internet connection and Try again',
            context);
      }
    } catch (e) {
      Get.find<LoginController>().isVisible.value = false;
      Get.find<LoginController>().visibleH.value = 15.h;
      Get.find<LoginController>().visibleW.value = 60.w;
      log(e.toString());
      SnackbarMessage().snackBarMessage(
          'Oops! something went wrong, Try again later', context);
    }
  }

  resetPassword(String email, BuildContext context) async {
    try {
      Get.find<LoginController>().loading.value = true;
      final response = await http.post(
          Uri.parse('${baseUrlApi}verification/sendmail'),
          body: {'email': email});
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        Get.find<LoginFieldController>().resetEmailController.clear();
        Get.find<LoginController>().resetErrorIsVisible.value = false;
        Get.find<LoginController>().loading.value = false;
        Get.back();
        SnackbarMessage().snackBarMessage(
            'Email send successfully! Login with new password', context);
      } else {
        Get.find<LoginController>().loading.value = false;
        Get.find<LoginController>().resetErrorIsVisible.value = true;
        final message = data['message'];
        Get.find<LoginController>().resetPassErrorOn(message);
      }
    } catch (e) {
      Get.find<LoginController>().loading.value = false;
      log(e.toString());
      Get.back();
      SnackbarMessage().snackBarMessage(
          'Oops! something went wrong, Try again later', context);
    }
  }
}
 // final isProfileSet = box.read('isProfileSet');
          // log(isProfileSet.toString());
          // if (isProfileSet == false && role == 0) {
          //   Get.offAll(
          //     () => const DirectorsAddView(
          //       title: 'Profile',
          //     ),
          //     binding: DirectorsAddBinding(),
          //   );
          // } else if (isProfileSet == true || role == 1) {
          //   SnackbarMessage()
          //       .snackBarMessage('Logged in successfully!', context);
          //   Get.offAllNamed(Routes.HOME);
          // }