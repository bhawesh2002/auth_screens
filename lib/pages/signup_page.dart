import 'package:flutter/material.dart';
import 'package:auth_screens/controllers/auth_state_controller.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthStateController _authStateController =
      Get.find<AuthStateController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: Get.width * 0.86,
            height: Get.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(Get.width * 0.025),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, Get.height * 0.010),
                  color: Colors.grey.shade300,
                  blurRadius: 30,
                  spreadRadius: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
