import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/data/models/profile_model.dart';
import 'package:protocols/app/data/providers/profile_provider.dart';

class SettingsController extends GetxController {
  final BuildContext context;
  Rx<Profile> profile = Profile(
    firstname: '',
    lastname: '',
    middlename: '',
    email: '',
    mobile: '',
    dob: '',
    pannumber: '',
    fathersname: '',
    address: '',
    image: '',
    companyid: '',
    id: '',
    password: '',
    role: '',
    v: 1,
    verified: true,
  ).obs;
  var loading = true.obs;
  SettingsController(this.context);
  getProfile(BuildContext context) async {
    await ProfileProvider().getProfileData(context);
    update();
  }

  @override
  void onClose() {
    ProfileProvider.isFinishedProfile = true;
    ProfileProvider().onClose();
    super.onClose();
  }

  @override
  void onInit() {
    getProfile(context);
    super.onInit();
  }
}
