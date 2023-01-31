import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/data/models/accounts_model.dart';
import 'package:protocols/app/data/providers/accounts_provider.dart';
import 'package:protocols/app/modules/add_account/controllers/add_account_controller.dart';

class AddAccButtonView extends GetView<AddAccountController> {
  const AddAccButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 15.w, right: 25.w, bottom: 15.h, top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 23.w,
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.zero,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            label: Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(colors: [
                  Color(0xff1F7DE5),
                  Color(0xff5DCCFF),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: TextButton(
              onPressed: () {
                if (!Get.find<AddAccountController>().loadingAdd.value) {
                  if (Get.find<AddAccountController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    Get.find<AddAccountController>().loadingAdd.value = true;
                    final acName = Get.find<AddAccountController>()
                        .accNameController
                        .text
                        .trim();
                    final bkName = Get.find<AddAccountController>()
                        .bankNameController
                        .text
                        .trim();
                    final acNickName = Get.find<AddAccountController>()
                        .nickNameController
                        .text
                        .trim();
                    final acNo = Get.find<AddAccountController>()
                        .acNoController
                        .text
                        .trim();
                    final ifsc = Get.find<AddAccountController>()
                        .ifscController
                        .text
                        .trim();
                    final account = AddAccounts(
                        bankname: bkName,
                        nickname: acNickName,
                        accountname: acName,
                        ifsc: ifsc,
                        accountnumber: acNo);
                    AccountsModelProvider().postAccount(account, context);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(8.w),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Obx(() {
                return (Get.find<AddAccountController>().loadingAdd.value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.7,
                        ),
                      )
                    : Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 30.h,
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
 // Get.snackbar(
                  //   'Clipboard',
                  //   'your text is copied!',
                  //   colorText: Colors.white,
                  //   backgroundColor: Colors.grey[800],
                  //   snackPosition: SnackPosition.BOTTOM,
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 25, vertical: 15),
                  // );