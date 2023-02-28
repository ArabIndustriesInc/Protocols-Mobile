import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/providers/registration_provider.dart';
import 'package:protocols/app/modules/otp-verify/controllers/otp_verify_controller.dart';
import 'package:protocols/app/modules/pricing_plan/bindings/pricing_plan_binding.dart';
import 'package:protocols/app/modules/pricing_plan/views/pricing_plan_view.dart';
import 'package:protocols/app/modules/signup/controllers/text_field_controller.dart';

otpVerify(String otp) async {
  try {
    final userId = box.read('user_id');
    final response =
        await http.post(Uri.parse('${baseUrlApi}register/verifyOtp'), body: {
      'userId': userId,
      'OTP': otp,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      bool status = data['verified'];
      if (status) {
        Get.to(
            () => const PricingPlanView(
                title: 'Make The Wise Decision For your Startup Solution'),
            binding: PricingPlanBinding());
      } else {
        Get.find<OtpVerifyController>().verify.value = true;
      }
    }
    // ignore: empty_catches
  } catch (e) {}
}

resendOtp() {
  final email = Get.find<TextFieldController>().emailController.text.trim();
  final password = box.read('password');
  final firstname =
      Get.find<TextFieldController>().firstNameController.text.trim();
  final lastname =
      Get.find<TextFieldController>().lastNameController.text.trim();
  final companyname =
      Get.find<TextFieldController>().companyController.text.trim();
  final phone = Get.find<TextFieldController>().phNoController.text.trim();
  register(email, password, firstname, lastname, companyname, phone);
}




// import 'package:get/get.dart';
// import 'package:protocols/app/data/models/registration_model.dart';

// class RegistrationProvider extends GetConnect {
//   Future<Registration?> getRegistration(int id) async {
//     final response = await get('registration/$id');
//     return response.body;
//   }

//   Future<Response<Registration>> postRegistration(
//           Registration registration) async =>
//       await post('localhost:2000/register/add', registration);
//   Future<Response> deleteRegistration(int id) async =>
//       await delete('registration/$id');
// }
