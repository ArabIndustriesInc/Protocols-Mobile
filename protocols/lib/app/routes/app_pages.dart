import 'package:get/get.dart';

import '../modules/accounts/bindings/accounts_binding.dart';
import '../modules/accounts/views/accounts_view.dart';
import '../modules/add_account/bindings/add_account_binding.dart';
import '../modules/add_account/views/add_account_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/directors/bindings/directors_binding.dart';
import '../modules/directors/views/directors_view.dart';
import '../modules/documents/bindings/documents_binding.dart';
import '../modules/documents/views/documents_view.dart';
import '../modules/employees/bindings/employees_binding.dart';
import '../modules/employees/views/employees_view.dart';
import '../modules/employees_add/bindings/employees_add_binding.dart';
import '../modules/employees_add/views/employees_add_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/investors/bindings/investors_binding.dart';
import '../modules/investors/views/investors_view.dart';
import '../modules/investors_add/bindings/investors_add_binding.dart';
import '../modules/investors_add/views/investors_add_view.dart';
import '../modules/links/bindings/links_binding.dart';
import '../modules/links/views/links_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notes/bindings/notes_binding.dart';
import '../modules/notes/views/notes_view.dart';
import '../modules/notes_add/bindings/notes_add_binding.dart';
import '../modules/notes_add/views/notes_add_view.dart';
import '../modules/otp-verify/bindings/otp_verify_binding.dart';
import '../modules/otp-verify/views/otp_verify_view.dart';
import '../modules/pricing_plan/bindings/pricing_plan_binding.dart';
import '../modules/pricing_plan/views/pricing_plan_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/todo/bindings/todo_binding.dart';
import '../modules/todo/views/todo_view.dart';
import '../modules/todo_add/bindings/todo_add_binding.dart';
import '../modules/todo_add/views/todo_add_view.dart';
import '../modules/transactions/bindings/transactions_binding.dart';
import '../modules/transactions/views/transactions_view.dart';
import '../modules/transactions_add/bindings/transactions_add_binding.dart';
import '../modules/transactions_add/views/transactions_add_view.dart';
import '../modules/voting/bindings/voting_binding.dart';
import '../modules/voting/views/voting_view.dart';
import '../modules/voting_add/bindings/voting_add_binding.dart';
import '../modules/voting_add/views/voting_add_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENTS,
      page: () => DocumentsView(),
      binding: DocumentsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LINKS,
      page: () => const LinksView(),
      binding: LinksBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNTS,
      page: () => const AccountsView(),
      binding: AccountsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ACCOUNT,
      page: () => const AddAccountView(),
      binding: AddAccountBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEES,
      page: () => const EmployeesView(),
      binding: EmployeesBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEES_ADD,
      page: () => const EmployeesAddView(),
      binding: EmployeesAddBinding(),
    ),
    GetPage(
      name: _Paths.DIRECTORS,
      page: () => const DirectorsView(),
      binding: DirectorsBinding(),
    ),
    GetPage(
      name: _Paths.INVESTORS,
      page: () => const InvestorsView(),
      binding: InvestorsBinding(),
    ),
    GetPage(
      name: _Paths.INVESTORS_ADD,
      page: () => const InvestorsAddView(),
      binding: InvestorsAddBinding(),
    ),
    GetPage(
      name: _Paths.NOTES,
      page: () => const NotesView(),
      binding: NotesBinding(),
    ),
    GetPage(
      name: _Paths.NOTES_ADD,
      page: () => const NotesAddView(),
      binding: NotesAddBinding(),
    ),
    GetPage(
      name: _Paths.VOTING,
      page: () => const VotingView(),
      binding: VotingBinding(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => const TodoView(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: _Paths.TODO_ADD,
      page: () => const TodoAddView(),
      binding: TodoAddBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () => const TransactionsView(),
      binding: TransactionsBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONS_ADD,
      page: () => const TransactionsAddView(),
      binding: TransactionsAddBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.VOTING_ADD,
      page: () => const VotingAddView(),
      binding: VotingAddBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => const OtpVerifyView(),
      binding: OtpVerifyBinding(),
    ),
  ];
}
