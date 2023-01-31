import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/add_account/controllers/add_acc_model_controller.dart';
import 'package:protocols/app/modules/add_account/controllers/add_account_controller.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';

class AddAccFieldView extends GetView<AddAccountController>
    with InputValidationMixin {
  const AddAccFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: Get.find<AddAccountController>().formKey,
        child: Wrap(
          runSpacing: 25.h,
          children: [
            TypeAheadField(
              animationStart: 0,
              animationDuration: Duration.zero,
              textFieldConfiguration: TextFieldConfiguration(
                controller: Get.find<AddAccountController>().bankNameController,
                keyboardType: TextInputType.name,
                cursorColor: Colors.grey[600],
                decoration: AddAccountController().bankNameDeco,
              ),
              suggestionsBoxDecoration: AddAccountController().suggNameDeco,
              suggestionsCallback: (pattern) {
                List<String> matches = <String>[];
                matches.addAll(Get.find<AddAccModelController>().suggestons);

                matches.retainWhere((s) {
                  return s.toLowerCase().contains(pattern.toLowerCase());
                });
                return matches;
              },
              itemBuilder: (context, sone) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
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
                Get.find<AddAccountController>().bankNameController.text =
                    suggestion;
              },
            ),
            TextFormField(
              controller: Get.find<AddAccountController>().nickNameController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Nick Name is required!";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.name,
              decoration: AddAccountController().nickNameDeco,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<AddAccountController>().accNameController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Account Name is required!";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.name,
              decoration: AddAccountController().accNameDeco,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<AddAccountController>().ifscController,
              textCapitalization: TextCapitalization.characters,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "IFSC Code is required!";
                } else if (!isIfscValid(value)) {
                  return "Enter valid IFSC Code!";
                } else {
                  return null;
                }
              }),
              decoration: AddAccountController().ifscDeco,
              keyboardType: TextInputType.text,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<AddAccountController>().acNoController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Account No is required!";
                } else if (!isAccNumberValid(value)) {
                  return "Enter valid account number!";
                } else {
                  return null;
                }
              }),
              decoration: AddAccountController().accNoDeco,
              keyboardType: TextInputType.number,
              maxLength: 18,
              cursorColor: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
            // TextFormField(
            //   controller: Get.find<AddAccountController>().bankNameController,
            //   validator: ((value) {
            //     if (value!.isEmpty) {
            //       return "Bank name is required!";
            //     } else {
            //       return null;
            //     }
            //   }),
            //   keyboardType: TextInputType.name,
            //   decoration: AddAccountController().bankNameDeco,
            //   cursorColor: Colors.grey[600],
            // ),