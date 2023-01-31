import 'package:get/get.dart';
import 'package:protocols/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  List dashboardIcon = [
    'assets/icons/documents.png',
    'assets/icons/accounts.png',
    'assets/icons/employees.png',
    'assets/icons/directors.png',
    'assets/icons/to-do.png',
    'assets/icons/voting.png',
    'assets/icons/transactions.png',
    'assets/icons/investors.png',
    'assets/icons/notes.svg',
  ];
  List dashboardTitle = [
    'Documents',
    'Accounts',
    'Employees',
    'Directors',
    'Todo List',
    'Voting',
    'Transactions',
    'Investors',
    'Notes',
  ];

  onClicked(String page) {
    if (page == 'Documents') {
      Get.toNamed(Routes.DOCUMENTS);
    } else if (page == 'Accounts') {
      Get.toNamed(Routes.ACCOUNTS);
    } else if (page == 'Transactions') {
      Get.toNamed(Routes.TRANSACTIONS);
    } else if (page == 'Employees') {
      Get.toNamed(Routes.EMPLOYEES);
    } else if (page == 'Directors') {
      Get.toNamed(Routes.DIRECTORS);
    } else if (page == 'Investors') {
      Get.toNamed(Routes.INVESTORS);
    } else if (page == 'Notes') {
      Get.toNamed(Routes.NOTES);
    } else if (page == 'Voting') {
      Get.toNamed(Routes.VOTING);
    } else if (page == 'Todo List') {
      Get.toNamed(Routes.TODO);
    }
  }
}
