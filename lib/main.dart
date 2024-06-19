import 'package:auth_screens/controllers/auth_state_controller.dart';
import 'package:auth_screens/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: unused_local_variable
  AuthStateController _authStateController = Get.put(AuthStateController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const SignupPage(),
    );
  }
}
