import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final _isInitialized = false.obs;
  final signUpStatus = false.obs;
  @override
  void onInit() {
    _isInitialized.value = true;
    debugPrint("SignupController Init Status: ${_isInitialized.value}");
    super.onInit();
  }

  void signup() {
    signUpStatus.value = true;
    signUpStatus.value == true
        ? debugPrint("Signing In")
        : debugPrint("Error has occured");
  }

  @override
  void dispose() {
    signUpStatus.value = false;
    _isInitialized.value = false;
    super.dispose();
  }
}
