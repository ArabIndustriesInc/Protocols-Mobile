import 'package:get/get.dart';
import 'package:protocols/app/data/models/accounts_model.dart';
import 'package:protocols/app/data/providers/accounts_provider.dart';
// import 'package:protocols/app/data/providers/accounts_show_provider.dart';

class AccountsController extends GetxController {
  List<Accounts> accounts = [];
  var loading = true.obs;
  Future<String> branchNameFinder(String ifsc) async {
    String branch = await AccountsModelProvider().getBranch(ifsc);
    return branch;
  }

  var branchName = ''.obs;
  branchNameReturn(String ifsc) async {
    branchName.value = await AccountsModelProvider().getBranch(ifsc);
    branchName.value = branchName.value.capitalize!;
  }
  // late AccountsModel accountSingle;

  // getAccount(int id) async {
  //   accountSingle = await AccountsModelProvider().getAccount(id);
  // }
  getAllAccounts() async {
    accounts = await AccountsModelProvider()
        .getAllAccounts()
        .whenComplete(() => loading.value = false);
    update();
  }

  @override
  void onInit() async {
    getAllAccounts();
    update();
    super.onInit();
  }
}
