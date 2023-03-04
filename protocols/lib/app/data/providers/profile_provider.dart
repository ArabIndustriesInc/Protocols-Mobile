// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/profile_model.dart';
import 'package:protocols/app/modules/settings/controllers/settings_controller.dart';

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
        log(profile.data.toString());
        isClosedList(profile.data);
        isClosedFunctionLoading('loading');
      } else {
        isClosedFunctionLoading('loading');
      }
    } catch (e) {
      log(e.toString());
      isClosedFunctionLoading('loading');
    }
  }

  isClosedList(Profile profile) {
    if (isFinishedProfile == false) {
      Get.find<SettingsController>().profile = profile;
      Get.find<SettingsController>().update();
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
        // case 'loadingEdit':
        //   Get.find<ProfileEditController>().loadingEdit.value = false;
        //   break;
      }
    }
  }
}
