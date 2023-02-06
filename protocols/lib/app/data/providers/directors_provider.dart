import 'dart:developer';

import 'package:get/get.dart';
import 'package:protocols/app/data/consts/api_consts.dart';
import 'package:protocols/app/data/models/directors_model.dart';
import 'package:protocols/app/modules/directors/controllers/directors_controller.dart';

class DirectorsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Directors.fromJson(map);
      if (map is List) {
        return map.map((item) => Directors.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = '${baseUrlApi}director/';
  }

  Future<List<Directors>> getAllDirectors() async {
    final token = box.read('login_token');
    final response = await get('${baseUrlApi}director/show',
        headers: {'Authorization': 'Bearer $token'});
    Get.find<DirectorsController>().loading.value = false;
    log(response.bodyString.toString());
    DirectorsModel directors = directorsModelFromJson(response.bodyString!);
    return directors.data;
  }

  // postAccount(AddAccounts accounts, BuildContext context) async {
  //   try {
  //     final token = box.read('login_token');
  //     final response =
  //         await http.post(Uri.parse('${baseUrlApi}bank/add'), body: {
  //       'bankname': accounts.bankname,
  //       'Nickname': accounts.nickname,
  //       'accountname': accounts.accountname,
  //       'ifsc': accounts.ifsc,
  //       'accountnumber': accounts.accountnumber,
  //     }, headers: {
  //       'Authorization': 'Bearer $token'
  //     });

  //     if (response.statusCode == 200) {
  //       getAllAccounts();
  //       Get.find<AccountsController>().getAllAccounts();
  //       Get.back(
  //         result: Get.find<AccountsController>().getAllAccounts(),
  //       );
  //       SnackbarMessage()
  //           .snackBarMessage('New account added successfully!', context);
  //     } else {
  //       log('failed');
  //       log(response.statusCode.toString());
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Future<Response> deleteAccountsModel(int id) async =>
      await delete('accounts/$id');
}
