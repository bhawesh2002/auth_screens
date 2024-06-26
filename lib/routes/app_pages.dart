import 'package:auth_screens/pages/auth_option_grid.dart';
import 'package:auth_screens/pages/login_page.dart';
import 'package:auth_screens/pages/signup_page.dart';
import 'package:auth_screens/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.authopt,
      page: () => const AuthOptionsPage(),
    )
  ];
}
