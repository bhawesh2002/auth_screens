import 'package:auth_screens/controllers/auth_state_controller.dart';
import 'package:auth_screens/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthStateController _authStateController =
      Get.put(AuthStateController());

  @override
  void initState() async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "AUTH SCREEENS",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
