import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/account_details/controllers/account_details_controller.dart';
import 'package:protocols/app/modules/accounts/controllers/accounts_controller.dart';
import 'package:protocols/app/modules/consts/appbar.dart';
import 'package:protocols/app/modules/drawer/views/drawer_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccDetailsEditView extends GetView<AccountDetailsController> {
  final int index;
  const AccDetailsEditView({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initValue();
    return Scaffold(
      appBar: AppBarCustom().appBar,
      drawer: DrawerView(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Text(
                  'Edit Accounts',
                  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: .9,
                      fontFamily: 'Montserrat Black'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              Form(
                key: Get.find<AccountDetailsController>().formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Wrap(
                    runSpacing: 20.h,
                    children: [
                      TypeAheadField(
                        animationStart: 0,
                        animationDuration: Duration.zero,
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: Get.find<AccountDetailsController>()
                              .bankNameController,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.grey[600],
                          decoration: AccountDetailsController().bankNameDeco,
                        ),
                        suggestionsBoxDecoration:
                            AccountDetailsController().suggNameDeco,
                        suggestionsCallback: (pattern) {
                          List<String> matches = <String>[];
                          matches.addAll(
                              Get.find<AccountDetailsController>().suggestons);

                          matches.retainWhere((s) {
                            return s
                                .toLowerCase()
                                .contains(pattern.toLowerCase());
                          });
                          return matches;
                        },
                        itemBuilder: (context, sone) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 15.w),
                            child: Text(
                              sone.toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Montserrat SemiBold',
                                color: Colors.black54,
                              ),
                            ),
                          );
                        },
                        onSuggestionSelected: (String suggestion) {
                          Get.find<AccountDetailsController>()
                              .bankNameController
                              .text = suggestion;
                        },
                      ),
                      TextFormField(
                        controller: Get.find<AccountDetailsController>()
                            .nickNameController,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Nick Name is required!";
                          } else {
                            return null;
                          }
                        }),
                        keyboardType: TextInputType.name,
                        decoration: AccountDetailsController().nickNameDeco,
                        cursorColor: Colors.grey[600],
                      ),
                      TextFormField(
                        controller: Get.find<AccountDetailsController>()
                            .accNameController,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Account Name is required!";
                          } else {
                            return null;
                          }
                        }),
                        keyboardType: TextInputType.name,
                        decoration: AccountDetailsController().accNameDeco,
                        cursorColor: Colors.grey[600],
                      ),
                      TextFormField(
                        controller:
                            Get.find<AccountDetailsController>().ifscController,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "IFSC Code is required!";
                          } else {
                            return null;
                          }
                        }),
                        decoration: AccountDetailsController().ifscDeco,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.grey[600],
                      ),
                      TextFormField(
                        controller:
                            Get.find<AccountDetailsController>().acNoController,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Account No. is required!";
                          } else {
                            return null;
                          }
                        }),
                        decoration: AccountDetailsController().accNoDeco,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.grey[600],
                      ),
                      // TextFormField(
                      //   controller: Get.find<AccountDetailsController>()
                      //       .brNameController,
                      //   validator: ((value) {
                      //     if (value!.isEmpty) {
                      //       return "Branch Name is required!";
                      //     } else {
                      //       return null;
                      //     }
                      //   }),
                      //   decoration: AccountDetailsController().brNameDeco,
                      //   keyboardType: TextInputType.number,
                      //   cursorColor: Colors.grey[600],
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const EditAccButtonView(),
    );
  }

  void initValue() async {
    final ifsc = Get.find<AccountsController>().accounts[index].ifsc;
    String branchName =
        await Get.find<AccountsController>().branchNameReturn(ifsc);
    Get.find<AccountDetailsController>().acNoController.text =
        Get.find<AccountsController>().accounts[index].accountnumber;
    Get.find<AccountDetailsController>().accNameController.text =
        Get.find<AccountsController>().accounts[index].accountname;
    Get.find<AccountDetailsController>().bankNameController.text =
        Get.find<AccountsController>().accounts[index].bankname;
    Get.find<AccountDetailsController>().brNameController.text = branchName;
    Get.find<AccountDetailsController>().ifscController.text = ifsc;
    Get.find<AccountDetailsController>().nickNameController.text =
        Get.find<AccountsController>().accounts[index].nickname;
    Get.find<AccountDetailsController>().update();
  }
}
// TextEditingController nickNameController =
//     TextEditingController(text: acNickName);
// TextEditingController accNameController = TextEditingController(text: acName);
// TextEditingController ifscController = TextEditingController(text: ifsc);
// TextEditingController acNoController = TextEditingController(text: acNo);
// TextEditingController brNameController = TextEditingController(text: bchName);
