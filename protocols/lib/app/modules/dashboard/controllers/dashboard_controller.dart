import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protocols/app/modules/accounts/bindings/accounts_binding.dart';
import 'package:protocols/app/modules/accounts/views/accounts_view.dart';
import 'package:protocols/app/modules/directors/bindings/directors_binding.dart';
import 'package:protocols/app/modules/directors/views/directors_view.dart';
import 'package:protocols/app/modules/documents/bindings/documents_binding.dart';
import 'package:protocols/app/modules/documents/views/documents_view.dart';
import 'package:protocols/app/modules/employees/bindings/employees_binding.dart';
import 'package:protocols/app/modules/employees/views/employees_view.dart';
import 'package:protocols/app/modules/investors/bindings/investors_binding.dart';
import 'package:protocols/app/modules/investors/views/investors_view.dart';
import 'package:protocols/app/modules/notes/bindings/notes_binding.dart';
import 'package:protocols/app/modules/notes/views/notes_view.dart';
import 'package:protocols/app/modules/todo/bindings/todo_binding.dart';
import 'package:protocols/app/modules/todo/views/todo_view.dart';
import 'package:protocols/app/modules/transactions/bindings/transactions_binding.dart';
import 'package:protocols/app/modules/transactions/views/transactions_view.dart';
import 'package:protocols/app/modules/voting/bindings/voting_binding.dart';
import 'package:protocols/app/modules/voting/views/voting_view.dart';

class DashboardController extends GetxController {
  List dashboardIconDirectors = [
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
  List dashboardTitleDirectors = [
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
  List dashboardIconInvestors = [
    'assets/icons/to-do.png',
    'assets/icons/voting.png',
    'assets/icons/notes.svg',
  ];
  List dashboardTitleInvestors = [
    'Todo List',
    'Voting',
    'Notes',
  ];

  onClicked(String page, BuildContext context) {
    if (page == 'Documents') {
      Get.to(() => const DocumentsView(), binding: DocumentsBinding(context));
    } else if (page == 'Accounts') {
      Get.to(() => const AccountsView(), binding: AccountsBinding(context));
    } else if (page == 'Transactions') {
      Get.to(() => const TransactionsView(),
          binding: TransactionsBinding(context));
    } else if (page == 'Employees') {
      Get.to(() => const EmployeesView(), binding: EmployeesBinding(context));
    } else if (page == 'Directors') {
      Get.to(() => const DirectorsView(), binding: DirectorsBinding(context));
    } else if (page == 'Investors') {
      Get.to(() => const InvestorsView(), binding: InvestorsBinding(context));
    } else if (page == 'Notes') {
      Get.to(() => const NotesView(), binding: NotesBinding(context));
    } else if (page == 'Voting') {
      Get.to(() => const VotingView(), binding: VotingBinding(context));
    } else if (page == 'Todo List') {
      Get.to(() => const TodoView(), binding: TodoBinding(context));
    }
  }
}
