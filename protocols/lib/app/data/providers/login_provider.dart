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
import 'package:protocols/app/modules/pricing_plan/bindings/pricing_plan_binding.dart';
import 'package:protocols/app/modules/pricing_plan/views/pricing_plan_view.dart';
import 'package:protocols/app/routes/app_pages.dart';

class LoginProvider {
  void login(String email, password, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse('${baseUrlApi}login/check'),
          body: {'email': email, 'password': password});
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        if (data["paid"] == true) {
          box.write('login_token', data['token']);
          box.write('paid_user', data['paid']);
          Get.offAllNamed(Routes.HOME);
          SnackbarMessage().snackBarMessage('Logged in successfully!', context);
        } else {
          box.write('paid_user', data['paid']);
          box.write('login_token', data['token']);
          Get.to(
              () => const PricingPlanView(
                  title: 'Make The Wise Decision For your Startup Solution'),
              binding: PricingPlanBinding());
        }
      } else {
        Get.find<LoginController>().isVisible.value = false;
        Get.find<LoginController>().visibleOff(data['message'].toString());
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
