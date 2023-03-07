// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/profile_model.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';
import 'package:protocols/app/modules/settings/controllers/settings_date_controller.dart';

class ProfileProvider extends GetConnect {
  static var isFinishedProfile = false;
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Profile.fromJson(map);
      if (map is List) {
        return map.map((item) => Profile.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}profile';
  }

  getProfileData(BuildContext context) async {
    isFinishedProfile = false;
    try {
      final token = box.read('login_token');
      final response = await get('${baseUrlApi}profile/show',
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        ProfileModel profile = profileModelFromJson(response.bodyString!);
        isClosedList(profile.data);
      } else {
        isClosedFunctionLoading('loading');
      }
    } catch (e) {
      log(e.toString());
      isClosedFunctionLoading('loading');
    }
  }

  editProfile(AddProfile profile, String filename, BuildContext context) async {
    isFinishedProfile = false;
    try {
      final token = box.read('login_token');

      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrlApi}profile/editprofile'));
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      request.headers.addAll(headers);
      request.fields.addAll({
        'firstname': profile.firstname,
        'lastname': profile.lastname,
        'middlename': profile.middlename ?? '',
        'email': profile.email,
        'mobile': profile.mobile,
        'dob': profile.dob,
        'pannumber': profile.pannumber,
        'address': profile.address,
        'fathersname': profile.fathersname,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'image', profile.image.path,
          filename: filename));
      http.Response response =
          await http.Response.fromStream(await request.send())
              .whenComplete(() => deleteImgFile());
      if (response.statusCode == 200) {
        getProfileData(context);
        isClosedMessage(SnackbarMessage()
            .snackBarMessage('Profile edited successfully!', context));
        Get.back();
        isClosedFunctionLoading('loadingEdit');
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

  deleteImgFile() {
    if (isFinishedProfile == false) {
      File(Get.find<SettingsDateController>().deleteFile!).delete();
    }
  }

  isClosedList(Profile profile) {
    if (isFinishedProfile == false) {
      Get.find<SettingsController>().profile.value = profile;
      Get.find<SettingsController>().update();
    }
    if (isFinishedProfile == false) {
      log(Get.find<SettingsController>().profile.value.toString());
      isClosedFunctionLoading('loading');
    }
  }

  isClosedMessage(dynamic message) {
    if (isFinishedProfile == false) {
      message;
    }
  }

  @override
  void onClose() {
    isFinishedProfile = true;
    super.onClose();
  }

  isClosedFunctionLoading(String name) {
    if (isFinishedProfile == false) {
      switch (name) {
        case 'loading':
          Get.find<SettingsController>().loading.value = false;
          break;
        case 'loadingEdit':
          Get.find<SettingsDateController>().loadingEdit.value = false;
          break;
      }
    }
  }
}
