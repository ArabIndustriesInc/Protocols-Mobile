import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/consts/form_validation_mixin.dart';
import 'package:protocols/app/modules/login/controllers/login_field_controller.dart';

class LoginFieldView extends GetView<LoginFieldController>
    with InputValidationMixin {
  const LoginFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Get.find<LoginFieldController>().formKeyLogin,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: Get.find<LoginFieldController>().emailController,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Email is required!";
                    } else if (!isEmailValid(value)) {
                      return "Invalid email! Enter valid email";
                    } else {
                      return null;
                    }
                  }),
                  keyboardType: TextInputType.emailAddress,
                  decoration: Get.find<LoginFieldController>().loginEmailDeco,
                  cursorColor: Colors.grey[600],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  controller:
                      Get.find<LoginFieldController>().passwordController,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Password is required!";
                    }
                    // else if (!isPasswordValid(value)) {
                    //   return "Password is not strong enough:\n- Must have minimum 8 charecters\n- Must have at least one uppercase letter\n- Must have atleast one lowercase letter\n- Must have atleast one number\n- Must have atleast one special character";
                    // }
                    else {
                      return null;
                    }
                  }),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: Get.find<LoginFieldController>().loginPassDeco,
                  cursorColor: Colors.grey[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
