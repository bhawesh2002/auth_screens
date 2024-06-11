import 'package:auth_screens/pages/home.dart';
import 'package:auth_screens/pages/login.dart';
import 'package:auth_screens/pages/signup.dart';
import 'package:auth_screens/pages/welcome.dart';
import 'package:auth_screens/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
    GetPage(name: AppRoutes.login, page: () => const LogIn()),
    GetPage(name: AppRoutes.signup, page: () => SignUp()),
    GetPage(name: AppRoutes.welcome, page: () => WelcomePage())
  ];
}
