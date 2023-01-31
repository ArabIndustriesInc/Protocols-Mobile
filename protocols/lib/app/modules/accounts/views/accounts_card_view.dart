import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/account_details/bindings/account_details_binding.dart';
import 'package:protocols/app/modules/account_details/views/account_details_view.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccsCardView extends GetView<AccountsController> {
  final int index;
  const AccsCardView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              blurRadius: 4,
              color: const Color(0xffABC2D4).withOpacity(.8),
            ),
          ],
        ),
        child: TextButton(
          // onLongPress: () {
          //   showDialog(
          //       context: context,
          //       builder: (context) {
          //         return DeleteAlertView(
          //           subtitle:
          //               'Are you sure, you want to delete this account? This action can\'t be reversed!',
          //           title: 'Delete Account',
          //           action: InkWell(
          //             highlightColor: Colors.grey[200],
          //             onTap: () {
          //               Get.back();
          //               SnackbarMessage().snackBarMessage(
          //                   'Account deleted successfully!', context);
          //             },
          //             child: const Text(
          //               "Confirm",
          //               style: TextStyle(
          //                 fontSize: 15.0,
          //                 color: Color.fromARGB(255, 227, 0, 0),
          //                 fontWeight: FontWeight.normal,
          //               ),
          //             ),
          //           ),
          //         );
          //       });
          // },
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () async {
            Get.to(
              () => AccountDetailsView(
                index: index,
              ),
              binding: AccountDetailsBinding(),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2,
              ),
              Text(
                Get.find<AccountsController>().accounts[index].nickname,
                style: TextStyle(
                    fontSize: 16.sp, color: Colors.black, letterSpacing: .3),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      Get.find<AccountsController>().accounts[index].bankname,
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        color: const Color(0xff787878),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'xxxx ${Get.find<AccountsController>().accounts[index].accountnumber.substring(Get.find<AccountsController>().accounts[index].accountnumber.length - 4)}',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        color: const Color(0xff787878),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
