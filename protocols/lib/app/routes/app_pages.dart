import 'package:get/get.dart';

import '../modules/add_account/bindings/add_account_binding.dart';
import '../modules/add_account/views/add_account_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/employees_add/bindings/employees_add_binding.dart';
import '../modules/employees_add/views/employees_add_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/investors_add/bindings/investors_add_binding.dart';
import '../modules/investors_add/views/investors_add_view.dart';
import '../modules/links/bindings/links_binding.dart';
import '../modules/links/views/links_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notes_add/bindings/notes_add_binding.dart';
import '../modules/notes_add/views/notes_add_view.dart';
import '../modules/otp-verify/bindings/otp_verify_binding.dart';
import '../modules/otp-verify/views/otp_verify_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/todo_add/bindings/todo_add_binding.dart';
import '../modules/todo_add/views/todo_add_view.dart';
import '../modules/transactions_add/bindings/transactions_add_binding.dart';
import '../modules/transactions_add/views/transactions_add_view.dart';
import '../modules/upgrade-plan/bindings/upgrade_plan_binding.dart';
import '../modules/upgrade-plan/views/upgrade_plan_view.dart';
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
      name: _Paths.ADD_ACCOUNT,
      page: () => const AddAccountView(),
      binding: AddAccountBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEES_ADD,
      page: () => const EmployeesAddView(),
      binding: EmployeesAddBinding(),
    ),
    GetPage(
      name: _Paths.INVESTORS_ADD,
      page: () => const InvestorsAddView(),
      binding: InvestorsAddBinding(),
    ),
    GetPage(
      name: _Paths.NOTES_ADD,
      page: () => const NotesAddView(),
      binding: NotesAddBinding(),
    ),
    GetPage(
      name: _Paths.TODO_ADD,
      page: () => const TodoAddView(),
      binding: TodoAddBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONS_ADD,
      page: () => const TransactionsAddView(),
      binding: TransactionsAddBinding(),
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
    GetPage(
      name: _Paths.UPGRADE_PLAN,
      page: () => const UpgradePlanView(),
      binding: UpgradePlanBinding(),
    ),
  ];
}
