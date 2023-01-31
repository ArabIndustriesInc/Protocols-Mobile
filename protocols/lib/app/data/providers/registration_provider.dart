import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:protocols/app/data/consts/api_consts.dart';

void register(
    String email, password, firstname, lastname, companyname, phone) async {
  try {
    Response response =
        await post(Uri.parse('${baseUrlApi}register/add'), body: {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'phone': phone,
      'companyname': companyname,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      box.write('user_id', data['data']['_id']);
      box.write('password', password);
    } else {
      log('failed');
      log(response.statusCode.toString());
    }
  } catch (e) {
    log(e.toString());
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
