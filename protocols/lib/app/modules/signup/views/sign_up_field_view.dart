import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/signup/controllers/text_field_controller.dart';

class SignUpFieldView extends GetView<TextFieldController>
    with InputValidationMixin {
  const SignUpFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Get.find<TextFieldController>().formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Wrap(
          runSpacing: 15.h,
          children: [
            TextFormField(
              controller: Get.find<TextFieldController>().firstNameController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "First name is required!";
                } else if (!isNameValid(value)) {
                  return "Invalid Name! Please enter valid name";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.name,
              decoration: Get.find<TextFieldController>().firstNameDeco,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<TextFieldController>().lastNameController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Last name is required!";
                } else if (!isNameValid(value)) {
                  return "Invalid Name! Please enter valid Name";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.name,
              decoration: Get.find<TextFieldController>().lastNameDeco,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<TextFieldController>().phNoController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Phone No. is required!";
                } else if (!isPhNoValid(value)) {
                  return "Invalid Number! Please enter valid Number";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.number,
              decoration: Get.find<TextFieldController>().phNoDeco,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<TextFieldController>().emailController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Email is required!";
                } else if (!isEmailValid(value)) {
                  return "Invalid Email! Please enter valid mail";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.emailAddress,
              decoration: Get.find<TextFieldController>().emailDeco,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<TextFieldController>().companyController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Company Name is required!";
                } else if (!isCompanyNameValid(value)) {
                  return "Invalid Company! Please enter valid Name";
                } else {
                  return null;
                }
              }),
              keyboardType: TextInputType.emailAddress,
              decoration: Get.find<TextFieldController>().companyDeco,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller: Get.find<TextFieldController>().passwordController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Password is required!";
                } else if (!isPasswordValid(value)) {
                  return "Password is not strong enough:\n- Must have minimum 8 charecters\n- Must have at least one uppercase letter\n- Must have atleast one lowercase letter\n- Must have atleast one number\n- Must have atleast one special character";
                } else {
                  return null;
                }
              }),
              decoration: Get.find<TextFieldController>().passwordDeco,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorColor: Colors.grey[600],
            ),
            TextFormField(
              controller:
                  Get.find<TextFieldController>().confirmPasswordController,
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Confirm Password is required!";
                } else if (value !=
                    Get.find<TextFieldController>().passwordController.text) {
                  return "Password does not match!";
                } else {
                  return null;
                }
              }),
              decoration: Get.find<TextFieldController>().confirmPasswordDeco,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorColor: Colors.grey[600],
            ),
            // Row(
            //   children: [
            //     Flexible(
            //       child: TextFormField(
            //         controller:
            //             Get.find<TextFieldController>().passwordController,
            //         validator: ((value) {
            //           if (value!.isEmpty) {
            //             return "Password is required!";
            //           } else if (!isPasswordValid(value)) {
            //             return "Password is not strong enough:\n- Must have minimum 8 charecters\n- Must have at least one uppercase letter\n- Must have atleast one lowercase letter\n- Must have atleast one number\n- Must have atleast one special character";
            //           } else {
            //             return null;
            //           }
            //         }),
            //         decoration: Get.find<TextFieldController>().passwordDeco,
            //         keyboardType: TextInputType.visiblePassword,
            //         obscureText: true,
            //         cursorColor: Colors.grey[600],
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10.w,
            //     ),
            //     Flexible(
            //       child: TextFormField(
            //         controller: Get.find<TextFieldController>()
            //             .confirmPasswordController,
            //         validator: ((value) {
            //           if (value!.isEmpty) {
            //             return "Confirm Password is required!";
            //           } else if (value !=
            //               Get.find<TextFieldController>()
            //                   .passwordController
            //                   .text) {
            //             return "Password does not match!";
            //           } else {
            //             return null;
            //           }
            //         }),
            //         decoration:
            //             Get.find<TextFieldController>().confirmPasswordDeco,
            //         keyboardType: TextInputType.visiblePassword,
            //         obscureText: true,
            //         cursorColor: Colors.grey[600],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
