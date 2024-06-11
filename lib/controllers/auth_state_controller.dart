import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  var isLoggedIn = false.obs;
  late User? currentUser;

  @override
  void onInit() {
    currentUser = FirebaseAuth.instance.currentUser;
    currentAuthState();
    super.onInit();
  }

  void currentAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isLoggedIn.value = false;
        debugPrint("User logged out");
      } else {
        currentUser = user;
        isLoggedIn.value = true;
        debugPrint("${currentUser?.email} Logged In");
      }
    });
  }

  Future<void> emailPassSignup(
      {required String email, required String password}) async {
    try {
      isLoggedIn.value = true;
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      currentUser = credential.user;
      if (currentUser != null) {
        debugPrint("Successfully Created user with ${currentUser?.email}");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('emailPassLogin Error: The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint(
            'emailPassLogin Error: The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        Get.snackbar('Network Error',
            'Please check your internet connection and try again.');
      } else {
        debugPrint('emailPassLogin Error: $e.');
      }
    } catch (e) {
      debugPrint("emailPassLogin Error:$e");
    }
  }

  Future<void> emailPassLogin(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      currentUser = credential.user;
      if (currentUser != null) {
        debugPrint("Signed in: ${currentUser?.email}");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('emailPassLogin Error: No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint(
            'emailPassLogin Error: Wrong password provided for that user.');
      } else {
        debugPrint("emailPassLogin Error:$e");
      }
    } catch (e) {
      debugPrint("emailPassLogin Error:$e");
    }
  }
}
