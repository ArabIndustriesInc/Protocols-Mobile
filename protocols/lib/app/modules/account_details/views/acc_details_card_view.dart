import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/account_details/controllers/account_details_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:protocols/app/modules/consts/appbar.dart';

class AccDetailsCardView extends GetView<AccountDetailsController> {
  final int index;
  const AccDetailsCardView({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 11.3),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                  color: const Color(0xffABC2D4).withOpacity(.8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    Get.find<AccountsController>().accounts[index].nickname,
                    style: TextStyle(
                        fontSize: 18.sp, color: const Color(0xff0C2242)),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  Get.find<AccountsController>().accounts[index].bankname,
                  style: TextStyle(
                      fontFamily: 'Montserrat Bold',
                      fontSize: 20.sp,
                      color: const Color(0xff0C2242)),
                ),
                SizedBox(
                  height: 25.h,
                ),
                BankDetailsTableContent(
                  title: 'Name',
                  content: Get.find<AccountsController>()
                      .accounts[index]
                      .accountname,
                ),
                Get.find<AccountDetailsController>().siz1_5,
                BankDetailsTableContent(
                  title: 'Account No',
                  content: Get.find<AccountsController>()
                      .accounts[index]
                      .accountnumber
                      .replaceAllMapped(
                          RegExp(r".{4}"), (match) => "${match.group(0)} "),
                ),
                Get.find<AccountDetailsController>().siz1_5,
                BankDetailsTableContent(
                  title: 'IFSC',
                  content: Get.find<AccountsController>().accounts[index].ifsc,
                ),
                Get.find<AccountDetailsController>().siz1_5,
                branchName(),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.to(() => AccDetailsEditView(
                    //           index: index,
                    //         ));
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //     shadowColor: Colors.transparent,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     minimumSize: const Size.square(43),
                    //     padding: EdgeInsets.zero,
                    //     backgroundColor:
                    //         const Color(0xff007EFF).withOpacity(.065),
                    //   ),
                    //   child: SvgPicture.asset(
                    //     'assets/icons/edit.svg',
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(copyText()).then((_) {
                          SnackbarMessage().snackBarMessage(
                              'Text copied successfully!', context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size.square(43),
                        padding: EdgeInsets.zero,
                        backgroundColor:
                            const Color(0xff007EFF).withOpacity(.065),
                      ),
                      child: SvgPicture.asset('assets/icons/copy.svg'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Obx branchName() {
    final ifsc =
        Get.find<AccountsController>().accounts[index].ifsc.toUpperCase();
    Get.find<AccountsController>().branchNameReturn(ifsc);
    return Obx(() {
      return BankDetailsTableContent(
        title: 'Branch',
        content: Get.find<AccountsController>().branchName.value,
      );
    });
  }

  ClipboardData copyText() {
    final accountNo = Get.find<AccountsController>()
        .accounts[index]
        .accountnumber
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
    return ClipboardData(
      text:
          '''Name: ${Get.find<AccountsController>().accounts[index].accountname}
Account No: $accountNo
IFSC: ${Get.find<AccountsController>().accounts[index].ifsc}
Bank: ${Get.find<AccountsController>().accounts[index].bankname}''',
    );
  }
}
