import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/modules/signup/controllers/signup_controller.dart';
import 'package:protocols/app/modules/signup/controllers/text_field_controller.dart';
import 'package:protocols/app/routes/app_pages.dart';

register(
    String email, password, firstname, lastname, companyname, phone) async {
  try {
    final response =
        await http.post(Uri.parse('${baseUrlApi}register/add'), body: {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'phone': phone,
      'companyname': companyname,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      if (data['message'] !=
          'Account created successfully,please enter otp to verify your account') {
        Get.find<SignUpController>().isVisible.value = false;
        Get.find<SignUpController>().loadingOff(data['message'].toString());
      } else {
        log(data['message']);
        Get.find<SignUpController>().isVisible.value = false;
        box.write('user_id', data['data']['_id']);
        box.write('password', password);
        Get.toNamed(Routes.OTP_VERIFY);
        Get.find<TextFieldController>().passwordController.clear();
        Get.find<TextFieldController>().confirmPasswordController.clear();
      }
    } else {
      log('failed');
      log(response.statusCode.toString());
      Get.find<SignUpController>().isVisible.value = false;
    }
  } catch (e) {
    log(e.toString());
    Get.find<SignUpController>().isVisible.value = false;
  }
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
