import 'package:auth_screens/controllers/auth_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final _isInitialized = false.obs;
  final signUpStatus = false.obs;
  final AuthStateController _authStateController =
      Get.find<AuthStateController>();
  @override
  void onInit() {
    _isInitialized.value = true;
    debugPrint("SignupController Init Status: ${_isInitialized.value}");
    super.onInit();
  }

  Future<void> signup() async {
    await _authStateController.emailPassSignup(
        email: "bhaweshmankar2002@gmail.com", password: "Bhavesh@2002");
  }

  @override
  void dispose() {
    signUpStatus.value = false;
    _isInitialized.value = false;
    super.dispose();
  }
}
